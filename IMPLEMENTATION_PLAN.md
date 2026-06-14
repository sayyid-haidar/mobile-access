# GARPIT Mobile UI Implementation Plan

Dokumen ini merangkum rencana implementasi tampilan dan interaksi awal berdasarkan `GARPIT - Mobile App Screens.pdf`. Fokus fase ini hanya UI, navigasi lokal, dan state dummy. Integrasi API, autentikasi asli, permission perangkat, dan koneksi door access hardware belum masuk scope.

## Scope Fase Awal

- Membangun ulang 3 screen utama dari desain:
  - Login
  - Pintu Saya
  - Detail Pintu
- Menyiapkan navigasi antar screen dengan data dummy.
- Membuat komponen visual reusable untuk card, badge, tombol, input, bottom navigation, dan ilustrasi perangkat.
- Menjaga layout nyaman di Android dan tetap layak dibuka di Web dengan kode Flutter yang sama.

## Pembagian Fase Implementasi

Supaya pekerjaan tidak terlalu berat, implementasi UI dibagi menjadi fase kecil. Setiap fase punya hasil yang bisa dicek langsung sebelum lanjut ke fase berikutnya.

### Fase 0: Asset dan Referensi

Status: selesai.

Tujuan:

- Menyiapkan asset visual yang dibutuhkan sebelum coding screen.
- Memastikan referensi PDF dan asset final tidak berubah diam-diam.

Task:

- Pastikan `GARPIT - Mobile App Screens.pdf` tetap menjadi referensi utama.
- Gunakan `assets/images/access_controller.png` untuk controller besar.
- Gunakan `assets/images/rfid_reader.png` untuk RFID reader.
- Gunakan `assets/images/garpit_wordmark.png` hanya jika wordmark image lebih cocok daripada teks.
- Pastikan `pubspec.yaml` sudah mendaftarkan `assets/images/`.

Definition of Done:

- [x] Semua asset bisa dipanggil dengan `Image.asset`.
- [x] Tidak ada dependency SVG tambahan yang wajib untuk fase UI awal.
- [x] Asset device terlihat bersih dan tidak seperti crop PDF mentah.
- [x] `flutter pub get` sukses setelah asset didaftarkan.
- [x] Referensi PDF tersedia di root project.

### Fase 1: Fondasi App dan Theme

Status: selesai.

Tujuan:

- Mengganti template counter app menjadi fondasi GARPIT.
- Menyiapkan theme, warna, typography, dan layout wrapper untuk mobile plus web.

Task:

- Bersihkan `lib/main.dart` dari counter app.
- Buat `GarpitApp`.
- Buat `app_theme.dart` berisi warna dan text style utama.
- Buat mobile-centered wrapper untuk Web dengan max width sekitar 430-480 px.
- Siapkan struktur folder `app/`, `screens/`, `widgets/`, dan `models/`.

Interaksi:

- Belum perlu navigasi penuh.
- App boleh langsung menampilkan placeholder screen.

Definition of Done:

- [x] App berjalan di Flutter.
- [x] Background, max width Web, dan SafeArea sudah siap.
- [x] Tidak ada overflow pada placeholder mobile 390x844.
- [x] `flutter analyze` sukses.
- [x] `flutter test` sukses.

### Fase 2: Komponen Reusable Dasar

Status: selesai.

Tujuan:

- Membuat building block visual sebelum masuk ke screen lengkap.

Task:

- Buat `GarpitButton` untuk primary dan secondary button.
- Buat `GarpitTextField` untuk input email/password.
- Buat `GarpitBadge` untuk status pill.
- Buat widget image device yang memakai asset controller dan RFID reader.
- Buat helper card/surface style bila dibutuhkan.

Interaksi:

- Button harus punya tap feedback.
- Text field harus bisa menerima input.

Definition of Done:

- [x] Komponen bisa dipakai ulang di semua screen.
- [x] Styling sudah mengikuti radius, border, warna, dan typography PDF.
- [x] Komponen tidak menambah elemen visual di luar referensi.
- [x] `GarpitButton` tersedia untuk primary dan secondary button.
- [x] `GarpitTextField` tersedia untuk input email/password.
- [x] `GarpitBadge` tersedia untuk status pill.
- [x] `AccessDeviceIllustration` tersedia dan memakai asset device.
- [x] `flutter analyze` sukses.
- [x] `flutter test` sukses.

### Fase 3: Login Screen

Status: selesai.

Tujuan:

- Mengimplementasikan screen pertama sesuai Page 1 PDF.

Task:

- Buat `LoginScreen`.
- Susun brand, tagline, card ilustrasi, section `Masuk`, form, link lupa password, dan tombol masuk.
- Gunakan `SingleChildScrollView` agar keyboard tidak menutup form.
- Gunakan asset controller dan RFID reader di card ilustrasi.

Interaksi:

- Email/password bisa diisi.
- Tap `Masuk` validasi kosong secara lokal.
- Jika valid, masuk ke `Pintu Saya`.
- Tap `Lupa password?` tampilkan snackbar placeholder.

Definition of Done:

- [x] Login screen mirip Page 1 PDF.
- [x] Form tidak overflow di tinggi 844 karena memakai scroll view.
- [x] Flow login dummy bisa lanjut ke placeholder dashboard.
- [x] Validasi lokal untuk email/password kosong tersedia.
- [x] `Lupa password?` menampilkan snackbar placeholder.
- [x] `flutter analyze` sukses.
- [x] `flutter test` sukses.

### Fase 4: Pintu Saya Screen

Status: selesai.

Tujuan:

- Mengimplementasikan dashboard daftar pintu sesuai Page 2 PDF.

Task:

- Buat model dummy `DoorItem`.
- Buat `DoorsScreen`.
- Buat `AccessPassCard`.
- Buat `DoorListItem`.
- Buat `GarpitBottomNav`.
- Isi data dummy untuk `Main Entrance`, `Office Door`, dan `Meeting Room`.

Interaksi:

- Tap `Main Entrance` membuka detail.
- Tab selain `Doors` menampilkan snackbar placeholder.
- Avatar `S` boleh menampilkan snackbar placeholder.
- `Main Entrance` tampil selected dengan border teal.

Definition of Done:

- [x] Screen `Pintu Saya` mirip Page 2 PDF.
- [x] Bottom navigation fixed di bawah.
- [x] List pintu bisa ditap tanpa error.
- [x] Tap `Main Entrance` membuka placeholder detail Fase 5.
- [x] Tab selain `Doors` menampilkan snackbar placeholder.
- [x] Tidak ada API/backend.
- [x] `flutter analyze` sukses.
- [x] `flutter test` sukses.

### Fase 5: Detail Pintu Screen

Status: selesai.

Tujuan:

- Mengimplementasikan detail pintu sesuai Page 3 PDF.

Task:

- Buat `DoorDetailScreen`.
- Buat status card pintu dengan RFID reader.
- Buat section aksi cepat.
- Buat segmented duration selector untuk `5m`, `15m`, `30m`, `Custom`.
- Buat card `Izin akses Anda`.

Interaksi:

- Tap back kembali ke `Pintu Saya`.
- Tap `Open Door` mengubah status lokal menjadi `Terbuka`.
- Tap `Lock Door` mengubah status lokal menjadi `Terkunci`.
- Tap durasi mengubah selected duration.
- Tap `Custom` menampilkan snackbar atau bottom sheet placeholder.

Definition of Done:

- [x] Detail screen mirip Page 3 PDF.
- [x] Status lokal berubah tanpa API.
- [x] Durasi aktif terlihat jelas.
- [x] Layout tetap bisa discroll jika tinggi layar kecil.
- [x] Tap back kembali ke `Pintu Saya`.
- [x] Tap `Open Door` mengubah status lokal menjadi `Terbuka`.
- [x] Tap `Lock Door` mengubah status lokal menjadi `Terkunci`.
- [x] Tap `Custom` menampilkan snackbar placeholder.
- [x] `flutter analyze` sukses.
- [x] `flutter test` sukses.

### Fase 6: Visual Polish dan Fidelity Review

Tujuan:

- Memastikan hasil implementasi tidak melenceng dari PDF.

Task:

- Jalankan app di Web atau emulator.
- Ambil screenshot ukuran 390x844.
- Bandingkan dengan 3 halaman PDF.
- Rapikan spacing, radius, typography, shadow, dan posisi asset.
- Pastikan Web tetap mobile-centered, bukan layout desktop baru.

Definition of Done:

- Checklist visual di bagian bawah dokumen terpenuhi.
- Tidak ada overflow pada ukuran mobile.
- Tidak ada elemen tambahan yang tidak ada di referensi.
- Interaksi dummy utama berjalan.

### Fase 7: Cleanup Ringan

Tujuan:

- Merapikan hasil UI agar siap untuk fase API nanti.

Task:

- Jalankan `flutter analyze`.
- Jalankan test bawaan atau update test bila template counter sudah dihapus.
- Hapus dead code dan komentar template Flutter.
- Pastikan nama file dan widget konsisten.

Definition of Done:

- Analyze tidak menunjukkan error.
- Project tetap bisa jalan.
- UI state dummy cukup jelas untuk nanti diganti API.

## Reference Fidelity Rules

Implementasi UI harus mengikuti `GARPIT - Mobile App Screens.pdf` sebagai sumber utama. Kalau ada keputusan desain yang tidak tertulis di dokumen ini, prioritasnya adalah meniru PDF, bukan membuat gaya baru.

Yang harus dijaga:

- Komposisi screen mengikuti referensi 390x844.
- Urutan section, teks, dan hierarki visual tidak diubah.
- Warna utama tetap putih, hitam, abu-abu, dan teal sesuai referensi.
- Tidak menambahkan fitur visual baru yang tidak ada di PDF, seperti ilustrasi lain, gradient, onboarding tambahan, drawer, atau animasi dekoratif.
- Tidak mengganti bottom navigation dengan pola navigasi lain.
- Tidak mengganti bentuk card besar, badge pill, input rounded, dan tombol full-width.
- Web hanya membungkus tampilan mobile agar rapi; bukan membuat layout desktop baru.
- Copywriting mengikuti PDF, termasuk bahasa Indonesia pada label dan deskripsi.

Pengecualian yang boleh:

- Ukuran sedikit menyesuaikan jika dibutuhkan untuk menghindari overflow pada perangkat kecil.
- Ilustrasi perangkat boleh dibuat ulang dengan Flutter shape selama proporsi, warna, dan kesan visualnya tetap sama.
- Icon bottom navigation boleh memakai icon Flutter yang paling mendekati jika detail icon PDF tidak tersedia.

## Prinsip Tampilan

- Desain mengikuti arah visual PDF: putih, bersih, tegas, dengan aksen teal.
- Typography terasa besar dan bold untuk headline, sementara teks pendukung memakai abu-abu.
- Card memakai sudut rounded besar, border tipis abu-abu, dan shadow halus hanya ketika desain membutuhkannya.
- Lebar konten dibatasi di Web agar tidak melebar aneh di desktop.
- Target utama tetap ukuran mobile sekitar 390x844 seperti desain.

## Struktur File yang Diusulkan

```text
lib/
  main.dart
  app/
    garpit_app.dart
    app_theme.dart
  screens/
    login_screen.dart
    doors_screen.dart
    door_detail_screen.dart
  widgets/
    app_status_bar_spacer.dart
    access_device_illustration.dart
    garpit_button.dart
    garpit_text_field.dart
    garpit_badge.dart
    access_pass_card.dart
    door_list_item.dart
    garpit_bottom_nav.dart
  models/
    door_item.dart
```

Catatan: struktur ini bisa disederhanakan kalau implementasi awal ingin lebih cepat, tetapi pemisahan di atas membuat UI mudah dirapikan tanpa menyentuh logic API nanti.

## Theme dan Design Token

Warna awal:

- Background utama: `#FFFFFF`
- Surface lembut: `#F7F8FA`
- Text utama: `#080A0F`
- Text sekunder: `#717987`
- Border: `#E1E5EA`
- Teal aksen: `#12C7B6`
- Teal gelap untuk badge aktif: `#0D3E4A`
- Success background: `#E2F8EF`
- Muted badge background: `#EEF2F8`

Typography:

- Gunakan font system Flutter dulu.
- Headline besar dibuat bold, ukuran sekitar 40-48 di mobile.
- Title card sekitar 28-36.
- Body dan label sekitar 16-20.
- Button text bold.

Spacing:

- Horizontal page padding: 24-28.
- Jarak section besar: 32-48.
- Jarak antar card/list item: 16-20.
- Radius card utama: 28-36.
- Radius input/button: 16-20.

## Asset yang Perlu Disiapkan

Untuk fase UI awal, asset paling penting adalah visual perangkat di PDF:

- Access control unit/controller besar pada screen Login.
- RFID/card reader kecil pada screen Login, Pintu Saya, dan Detail Pintu.
- Logo/wordmark `GARPIT` jika ada versi resmi.

Rekomendasi:

- Jika ingin hasil paling dekat dengan PDF, export visual perangkat dari Figma sebagai `SVG` atau `PNG` transparan.
- Untuk Flutter, `PNG` transparan resolusi 2x/3x paling aman tanpa dependency tambahan.
- Jika memakai `SVG`, perlu menambahkan package seperti `flutter_svg`, tetapi itu bisa ditunda sampai asset final tersedia.
- Kalau asset final belum tersedia, perangkat bisa dibuat sementara dengan Flutter shape murni. Ini cukup untuk prototype UI, tetapi detailnya tidak akan 100% sama dengan referensi.

Nama file yang disarankan:

```text
assets/images/access_controller.png
assets/images/rfid_reader.png
assets/images/garpit_wordmark.png
```

Status asset saat ini:

- `assets/images/access_controller.svg` sudah dibuat ulang sebagai source vector.
- `assets/images/access_controller.png` sudah dirender ulang dari SVG untuk pemakaian Flutter tanpa dependency tambahan.
- `assets/images/rfid_reader.svg` sudah dibuat ulang sebagai source vector.
- `assets/images/rfid_reader.png` sudah dirender ulang dari SVG untuk pemakaian Flutter tanpa dependency tambahan.
- `assets/images/logo.svg` sudah ada di project sebagai source logo/wordmark.
- `assets/images/garpit_wordmark.png` sudah disiapkan dari `logo.svg` agar bisa langsung dipakai dengan `Image.asset` tanpa dependency SVG.

Konfigurasi `pubspec.yaml` nanti:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

Asset yang tidak wajib disiapkan sekarang:

- Icon bottom navigation, karena bisa memakai `Icons.meeting_room`, `Icons.badge`, `Icons.history`, dan `Icons.person_outline` dari Material Icons.
- Status icon kecil di list pintu, karena di PDF tampil sebagai kotak rounded lembut dan bisa dibuat dari Flutter `Container`.

## Screen 1: Login

Elemen:

- Area atas dengan status bar spacing manual atau SafeArea.
- Brand `GARPIT`.
- Tagline `Door access for your workspace`.
- Card ilustrasi perangkat:
  - Controller besar.
  - Reader kecil.
  - Caption `Akses pintu aman untuk pengguna terdaftar`.
- Judul section `Masuk`.
- Deskripsi `Gunakan akun yang sudah diberikan oleh admin gedung atau kantor.`
- Input email.
- Input password dengan teks tersamarkan.
- Link `Lupa password?`.
- Tombol utama `Masuk`.

Interaksi:

- Form menerima input lokal.
- Password bisa dibuat tersamarkan dulu tanpa toggle visibility karena desain tidak menampilkan icon.
- Tap `Masuk` membawa user ke screen `Pintu Saya`.
- Tap `Lupa password?` sementara menampilkan snackbar atau bottom sheet ringan dengan pesan placeholder.
- Keyboard tidak boleh menutup tombol login; gunakan scroll view.

State lokal:

- Email default kosong.
- Password default kosong.
- Validasi sederhana:
  - Kalau email/password kosong, tampilkan snackbar.
  - Kalau terisi, lanjut ke dashboard.

## Screen 2: Pintu Saya

Elemen:

- Header:
  - Title `Pintu Saya`.
  - Subtitle `Pilih pintu yang bisa Anda akses`.
  - Avatar circle dengan inisial `S`.
- Access pass card:
  - Label `GARPIT ACCESS PASS`.
  - Nama `Sayid Haidar`.
  - Role `Member Access`.
  - Badge `Aktif`.
  - Ilustrasi reader.
- Section title `Akses tersedia`.
- List pintu:
  - `Main Entrance`, subtitle `Buka 24 jam sesuai izin`, status `Terkunci`.
  - `Office Door`, subtitle `Senin-Jumat, 08.00-18.00`, status `Terkunci`.
  - `Meeting Room`, subtitle `Akses sampai 16.30`, status `Terbuka`.
- Bottom navigation:
  - `Doors`
  - `Access`
  - `Logs`
  - `Profile`

Interaksi:

- Tap item `Main Entrance` membuka screen detail pintu.
- Item lain juga boleh membuka detail dengan data masing-masing, atau untuk fase awal hanya `Main Entrance` yang aktif.
- Bottom nav:
  - Tab `Doors` aktif.
  - Tab lain menampilkan snackbar placeholder, misalnya `Access belum tersedia`.
- Avatar bisa menampilkan snackbar/profile placeholder.
- Item terpilih mendapat border teal seperti desain.

State lokal:

- Daftar pintu hardcoded.
- Status pintu bisa `locked` atau `open`.
- Selected door default: `Main Entrance`.

## Screen 3: Detail Pintu

Elemen:

- Header:
  - Tombol back berbentuk circle.
  - Title nama pintu, contoh `Main Entrance`.
  - Subtitle `Anda punya akses ke pintu ini`.
- Status card:
  - Ilustrasi reader.
  - Label `Status pintu`.
  - Status besar `Terkunci` atau `Terbuka`.
  - Badge kanan `Ready to open` ketika terkunci.
  - Caption `Terakhir dibuka 5 menit lalu oleh Anda`.
- Section `Aksi cepat`.
- Tombol utama `Open Door`.
- Tombol secondary `Lock Door`.
- Card `Buka sementara`:
  - Deskripsi `Biarkan pintu terbuka dalam durasi tertentu.`
  - Pilihan durasi `5m`, `15m`, `30m`, `Custom`.
- Card `Izin akses Anda`:
  - Subtitle `Akses aktif sampai 18.00 hari ini`.
  - Badge `Active`.

Interaksi:

- Tap back kembali ke `Pintu Saya`.
- Tap `Open Door` mengubah state lokal pintu menjadi `Terbuka`.
- Tap `Lock Door` mengubah state lokal pintu menjadi `Terkunci`.
- Status text dan badge ikut berubah sesuai state.
- Pilihan durasi bisa dipilih secara segmented; default `5m`.
- Tap `Custom` sementara menampilkan bottom sheet pilihan placeholder atau snackbar.

State lokal:

- `isLocked`.
- `selectedTemporaryDuration`.
- `lastOpenedText` dummy.

## Komponen Reusable

### `AccessDeviceIllustration`

Ilustrasi memakai asset PNG yang sudah dibuat ulang dari SVG:

- `assets/images/access_controller.png` untuk controller besar.
- `assets/images/rfid_reader.png` untuk RFID reader.
- Penempatan, ukuran, dan layering disesuaikan per screen agar tetap mirip PDF.

Catatan: source vector tetap disimpan di `assets/images/access_controller.svg` dan `assets/images/rfid_reader.svg` untuk revisi visual berikutnya.

### `GarpitButton`

Variant:

- Primary: background hitam, text putih.
- Secondary: background putih, border abu-abu, text hitam.

State:

- Normal.
- Pressed via default Flutter ink/tap feedback.
- Disabled nanti bisa ditambahkan.

### `GarpitBadge`

Variant:

- Active dark.
- Success light.
- Muted locked.
- Teal selected.

### `DoorListItem`

Props:

- Title.
- Subtitle.
- Status label.
- Status variant.
- Selected.
- On tap.

## Navigasi

Untuk fase awal, cukup pakai `Navigator.push` / `Navigator.pop` bawaan Flutter.

Flow:

```text
Login
  -> Pintu Saya
      -> Detail Pintu
          -> kembali ke Pintu Saya
```

Belum perlu router package sampai flow aplikasi lebih besar.

## Responsif Android dan Web

Mobile:

- Layout mengikuti full screen.
- Gunakan `SafeArea`.
- Bottom nav fixed di bawah screen dashboard.
- Detail screen bisa scroll jika tinggi layar kecil.

Web:

- Bungkus screen dengan max width sekitar 430-480 px dan center di viewport.
- Background luar bisa memakai abu-abu sangat muda agar frame mobile tetap terlihat rapi.
- Interaksi tetap klik/tap sama.

## Out of Scope Fase Ini

- Login API.
- Token/session storage.
- Door unlock API.
- Realtime door status.
- Push notification.
- Role dan permission asli.
- Log aktivitas asli.
- Profile asli.
- Deep linking.
- Native Android permission.

## Urutan Implementasi

Ikuti pembagian fase di atas agar pekerjaan tetap ringan dan mudah direview:

1. Fase 0: Asset dan Referensi.
2. Fase 1: Fondasi App dan Theme.
3. Fase 2: Komponen Reusable Dasar.
4. Fase 3: Login Screen.
5. Fase 4: Pintu Saya Screen.
6. Fase 5: Detail Pintu Screen.
7. Fase 6: Visual Polish dan Fidelity Review.
8. Fase 7: Cleanup Ringan.

Setelah setiap fase selesai, lakukan cek visual singkat sebelum lanjut. Jangan menunggu semua screen selesai baru membandingkan dengan PDF.

## Kriteria Selesai Fase UI

- Ketiga screen dari PDF sudah ada di aplikasi Flutter.
- Tombol `Masuk` membuka dashboard.
- Tap pintu membuka detail.
- Tombol `Open Door` dan `Lock Door` mengubah status lokal.
- Pilihan durasi bisa dipilih.
- Bottom nav tampil sesuai desain, minimal tab `Doors` aktif.
- Tampilan tidak overflow pada ukuran mobile 390x844.
- Web tetap bisa dibuka dengan layout mobile-centered.

## Checklist Review Visual Terhadap PDF

Sebelum fase UI dianggap selesai, bandingkan hasil aplikasi dengan render PDF berikut:

- Page 1: Login screen.
- Page 2: Pintu Saya screen.
- Page 3: Detail Pintu screen.

Checklist umum:

- Safe area atas terasa sama dengan referensi.
- Padding horizontal konsisten, sekitar 24-28 px.
- Headline besar dan bold seperti PDF.
- Warna teks sekunder tidak terlalu gelap.
- Radius card besar dan input mendekati referensi.
- Border list item dan input tipis, bukan terlalu kontras.
- Tombol utama hitam penuh dengan text putih.
- Badge berbentuk pill dengan warna sesuai status.
- Tidak ada elemen tambahan yang mengganggu kemiripan.

Checklist Login:

- `GARPIT` berada di atas, besar, warna navy gelap.
- Tagline tepat di bawah brand.
- Card ilustrasi perangkat berada sebelum section `Masuk`.
- Section `Masuk` berada di bawah card, bukan di atas.
- Input email dan password memakai border rounded.
- Link `Lupa password?` rata kanan.
- Tombol `Masuk` berada dekat bagian bawah screen.

Checklist Pintu Saya:

- Header berisi title, subtitle, dan avatar inisial `S`.
- Access pass card memiliki ilustrasi reader di kanan.
- Badge `Aktif` berada di bawah role.
- Section `Akses tersedia` muncul sebelum daftar pintu.
- Item `Main Entrance` tampil selected dengan border teal.
- Status `Terkunci` dan `Terbuka` memakai pill sesuai referensi.
- Bottom nav berada fixed di bawah dengan tab `Doors` aktif.

Checklist Detail Pintu:

- Back button berupa circle di kiri title.
- Title `Main Entrance` dan subtitle berada di header.
- Status card besar berisi ilustrasi reader, status, badge, dan caption.
- Tombol `Open Door` hitam, `Lock Door` putih dengan border.
- Card `Buka sementara` berisi pilihan `5m`, `15m`, `30m`, `Custom`.
- Pilihan `5m` aktif secara default.
- Card `Izin akses Anda` berada di bagian bawah dengan badge `Active`.
