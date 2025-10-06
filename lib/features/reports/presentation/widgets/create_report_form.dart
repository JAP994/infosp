import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import '../bloc/report_bloc.dart';
import '../bloc/report_event.dart';
import '../bloc/report_state.dart';

class CreateReportForm extends StatefulWidget {
  const CreateReportForm({super.key});

  @override
  CreateReportFormState createState() => CreateReportFormState();
}

class CreateReportFormState extends State<CreateReportForm> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedFile;

  final _detectedDateTimeController = TextEditingController();
  final _detectedLocationUnitController = TextEditingController();
  final _involvedMaterialPersonnelController = TextEditingController();
  final _detailedDescriptionController = TextEditingController();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg'],
      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      final pickedFile = File(result.files.single.path!);
      final extension = pickedFile.path.split('.').last.toLowerCase();
      if (!['pdf', 'jpg', 'jpeg'].contains(extension)) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Solo se permiten archivos PDF o JPG'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      setState(() => _selectedFile = pickedFile);
    }
  }

  Future<void> _pickDateTime() async {
    DateTime now = DateTime.now();
    if (!mounted) return;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: now,
    );

    if (!mounted || pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );

    if (!mounted || pickedTime == null) return;

    DateTime combined = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    if (combined.isAfter(now)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se permite seleccionar fecha/hora futura'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    _detectedDateTimeController.text = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(combined);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe seleccionar un archivo'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<ReportBloc>().add(
      CreateReportEvent(
        filePath: _selectedFile!.path,
        detectedDateTime: _detectedDateTimeController.text,
        detectedLocationUnit: _detectedLocationUnitController.text,
        involvedMaterialPersonnel: _involvedMaterialPersonnelController.text,
        detailedDescription: _detailedDescriptionController.text,
      ),
    );
  }

  @override
  void dispose() {
    _detectedDateTimeController.dispose();
    _detectedLocationUnitController.dispose();
    _involvedMaterialPersonnelController.dispose();
    _detailedDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportBloc, ReportState>(
      listener: (context, state) {
        if (state is ReportCreatedSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Informe enviado correctamente'),
              backgroundColor: Colors.green,
            ),
          );
          _formKey.currentState!.reset();
          setState(() => _selectedFile = null);
          _detectedDateTimeController.clear();
          _detectedLocationUnitController.clear();
          _involvedMaterialPersonnelController.clear();
          _detailedDescriptionController.clear();
        } else if (state is ReportCreationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ReportCreating;
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickDateTime,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _detectedDateTimeController,
                      decoration: const InputDecoration(
                        labelText: 'Fecha y hora detectada',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obligatorio';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _detectedLocationUnitController,
                  decoration: const InputDecoration(labelText: 'Reparto'),
                  textCapitalization: TextCapitalization
                      .characters, // convierte a mayúsculas mientras escribes
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6), // máximo 6 caracteres
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[A-Za-z]'),
                    ), // solo letras
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    } else if (value.length != 6) {
                      return 'Debe tener exactamente 6 letras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _involvedMaterialPersonnelController,
                  decoration: const InputDecoration(
                    labelText: 'Materiales o personal involucrado',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _detailedDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción detallada',
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickFile,
                      child: const Text('Seleccionar archivo'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _selectedFile != null
                            ? _selectedFile!.path.split('/').last
                            : 'Ningún archivo seleccionado',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submit,
                        child: const Text('Enviar ISP'),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
