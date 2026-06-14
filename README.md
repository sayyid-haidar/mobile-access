<div align="center">
  <img src="assets/images/garpit_wordmark.png" alt="GARPIT" width="220" />

  <p><strong>Door access for your workspace</strong></p>

  <p>
    <img alt="Flutter" src="https://img.shields.io/badge/Flutter-UI%20Prototype-02569B?logo=flutter&logoColor=white" />
    <img alt="Dart" src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white" />
    <img alt="Targets" src="https://img.shields.io/badge/Targets-Android%20%2B%20Web-12C7B6" />
  </p>
</div>

---

## Overview

**GARPIT Mobile** adalah prototype Flutter untuk aplikasi akses pintu workspace. Project ini mengikuti referensi desain `GARPIT - Mobile App Screens.pdf` dan saat ini fokus pada UI, navigasi lokal, serta interaksi dummy.

Prototype ini sudah bisa dijalankan di **Android** dan **Web** dari codebase Flutter yang sama.

## Preview Flow

```text
Login
  -> Pintu Saya
      -> Detail Pintu
```

### Login

- Validasi lokal untuk email/password kosong.
- Login dummy jika email/password terisi.
- `Lupa password?` menampilkan snackbar placeholder.

### Pintu Saya

- Access pass dummy untuk `Sayid Haidar`.
- Daftar pintu dummy:
  - `Main Entrance`
  - `Office Door`
  - `Meeting Room`
- Bottom nav fixed:
  - `Doors`
  - `Access`
  - `Logs`
  - `Profile`

### Detail Pintu

- Status lokal `Terkunci` / `Terbuka`.
- Tombol `Open Door` dan `Lock Door`.
- Pilihan durasi dummy `5m`, `15m`, `30m`, dan `Custom`.
- Card `Izin akses Anda`.

## Tech Stack

- [Flutter](https://flutter.dev/)
- Dart
- Android target
- Web target

## Project Structure

```text
lib/
  app/
    app_theme.dart
    garpit_app.dart
    garpit_app_frame.dart
  models/
    door_item.dart
  screens/
    login_screen.dart
    doors_screen.dart
    door_detail_screen.dart
    phase_one_placeholder_screen.dart
  widgets/
    access_device_illustration.dart
    access_pass_card.dart
    door_list_item.dart
    garpit_badge.dart
    garpit_bottom_nav.dart
    garpit_button.dart
    garpit_text_field.dart
```

## Assets

```text
assets/images/
  access_controller.png
  access_controller.svg
  rfid_reader.png
  rfid_reader.svg
  logo.svg
  garpit_wordmark.png
```

Flutter memakai PNG untuk runtime agar tidak perlu dependency SVG tambahan. SVG tetap disimpan sebagai source asset untuk revisi visual.

## Quick Start

Install dependencies:

```bash
flutter pub get
```

Check available devices:

```bash
flutter devices
```

Run on Chrome:

```bash
flutter run -d chrome --web-port 5174
```

Run on Android:

```bash
flutter run -d android
```

## Stable Web Preview

Untuk preview Web yang stabil saat reload:

```bash
flutter build web --pwa-strategy=none
python3 -m http.server 5174 --bind 127.0.0.1 --directory build/web
```

Open:

```text
http://127.0.0.1:5174
```

## Quality Checks

Format:

```bash
dart format lib test
```

Analyze:

```bash
flutter analyze
```

Test:

```bash
flutter test
```

Build Web:

```bash
flutter build web --pwa-strategy=none
```

## Firefox / Service Worker Note

Kalau Firefox masih menampilkan build lama:

1. Buka `about:serviceworkers`.
2. Cari `localhost:5174`.
3. Klik **Unregister**.
4. Reload `http://localhost:5174`.

Project ini juga menambahkan cleanup di [web/index.html](web/index.html) untuk unregister service worker dan clear Cache Storage saat local preview.

## Design Reference

Referensi utama:

```text
GARPIT - Mobile App Screens.pdf
```

UI implementation should stay close to the PDF reference. Any meaningful visual change should be reflected in [IMPLEMENTATION_PLAN.md](IMPLEMENTATION_PLAN.md).
