# 🚀 Instalación de Flutter en macOS, Windows y Linux

Este README muestra cómo instalar **Flutter** paso a paso de manera rápida, visual y amigable para GitHub.

---

## 📌 Requisitos previos

- ✅ Conexión a internet estable  
- ✅ Espacio en disco: mínimo 2.8 GB  
- ✅ Editor recomendado: **Visual Studio Code** o **Android Studio**

---

## 🍏 macOS

### 1️⃣ Instalar Homebrew (opcional, recomendado)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
```

### 2️⃣ Descargar Flutter SDK
- Página oficial: [Flutter macOS](https://docs.flutter.dev/get-started/install/macos)  
- Descomprimir en `~/development`:
```bash
cd ~/development
unzip ~/Downloads/flutter_macos_<version>-stable.zip
```

### 3️⃣ Configurar PATH
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```
Para hacerlo permanente:
```bash
nano ~/.zshrc
# agregar export PATH...
source ~/.zshrc
```

### 4️⃣ Verificar instalación
```bash
flutter doctor
```

---

## 🪟 Windows

### 1️⃣ Descargar Flutter SDK
- Página oficial: [Flutter Windows](https://docs.flutter.dev/get-started/install/windows)  
- Descomprimir en `C:\src\flutter`

### 2️⃣ Configurar PATH
- Abrir **Editar variables de entorno del sistema**  
- Agregar: `C:\src\flutter\bin`

### 3️⃣ Verificar instalación
```powershell
flutter doctor
```

---

## 🐧 Linux (Ubuntu/Debian)

### 1️⃣ Instalar dependencias
```bash
sudo apt update
sudo apt install curl git unzip xz-utils zip libglu1-mesa -y
```

### 2️⃣ Descargar Flutter SDK
```bash
cd ~/development
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_<version>-stable.tar.xz
tar xf flutter_linux_<version>-stable.tar.xz
```

### 3️⃣ Configurar PATH
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```
Para hacerlo permanente:
```bash
nano ~/.bashrc
# agregar export PATH...
source ~/.bashrc
```

### 4️⃣ Verificar instalación
```bash
flutter doctor
```

---

## ⚙️ Configuración adicional

- **Android Studio (opcional)**: [Descargar](https://developer.android.com/studio) y configurar SDK + emuladores  
- **Visual Studio Code (opcional)**: [Descargar](https://code.visualstudio.com/) + extensiones Flutter y Dart

### Crear proyecto de prueba
```bash
flutter create mi_app
cd mi_app
flutter run
```

---

## ✅ Tips finales

- Verificar dependencias:
```bash
flutter doctor
```
- Actualizar Flutter:
```bash
flutter upgrade
```
- Listar dispositivos conectados:
```bash
flutter devices
```

---
✨ ¡Listo! Ahora tu README está optimizado para GitHub con formato visual, emojis y pasos claros.

