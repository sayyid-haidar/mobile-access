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

Ilustrasi dibuat dengan Flutter widget murni dulu, bukan asset bitmap:

- Bentuk controller dan reader memakai `Container`, `BoxDecoration`, shadow, dan rounded corners.
- Aksen teal memakai bar kecil.
- Simbol NFC bisa dibuat dari text sederhana atau icon custom ringan.

Keuntungan: tidak perlu asset eksternal, tampil tajam di Android dan Web.

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

1. Bersihkan template counter app di `lib/main.dart`.
2. Tambahkan theme dan struktur app dasar.
3. Implement komponen reusable visual.
4. Implement `LoginScreen`.
5. Implement `DoorsScreen` dengan data dummy.
6. Implement `DoorDetailScreen` dengan state lokal.
7. Tambahkan navigasi antar screen.
8. Cek layout di Chrome untuk target Web.
9. Cek layout di Android/emulator jika device tersedia.
10. Rapikan spacing, radius, dan teks agar mendekati PDF.

## Kriteria Selesai Fase UI

- Ketiga screen dari PDF sudah ada di aplikasi Flutter.
- Tombol `Masuk` membuka dashboard.
- Tap pintu membuka detail.
- Tombol `Open Door` dan `Lock Door` mengubah status lokal.
- Pilihan durasi bisa dipilih.
- Bottom nav tampil sesuai desain, minimal tab `Doors` aktif.
- Tampilan tidak overflow pada ukuran mobile 390x844.
- Web tetap bisa dibuka dengan layout mobile-centered.
