import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';
import '../../features/reports/data/datasources/report_remote_datasource.dart';
import '../../features/reports/data/repositories/report_repository_impl.dart';
import '../../features/reports/domain/repositories/report_repository.dart';
import '../../features/reports/domain/usecases/get_reports_paginated.dart';
import '../../features/reports/domain/usecases/get_report_detail.dart';
import '../../features/reports/presentation/bloc/report_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => DioClient.getClient());

  // DataSource
  sl.registerLazySingleton<ReportRemoteDataSource>(
    () => ReportRemoteDataSourceImpl(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<ReportRepository>(() => ReportRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => GetReportsPaginated(sl()));
  sl.registerLazySingleton(() => GetReportDetail(sl()));

  // Bloc
  sl.registerFactory(
    () => ReportBloc(getReportsPaginated: sl(), getReportDetail: sl()),
  );
}
