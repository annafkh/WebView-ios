# Annme - Aplikasi iOS

Ini adalah aplikasi iOS dari project Laravel bernama **Annme**, yang dibungkus menjadi aplikasi mobile menggunakan WebView. Aplikasi ini memuat versi web Laravel agar dapat dijalankan sebagai aplikasi native di perangkat iOS.

## Deskripsi

**Annme** adalah aplikasi manajemen keuangan pribadi yang dibangun menggunakan Laravel, dan kemudian di-convert menjadi aplikasi iOS menggunakan Xcode dengan pendekatan WebView. Tujuannya adalah agar pengguna dapat menikmati pengalaman seperti aplikasi native saat mengakses platform Laravel.

## Fitur

- Menampilkan website Laravel dalam bentuk aplikasi iOS
- Mendukung navigasi, login, dan interaksi pengguna seperti di versi web
- Menggunakan WebViewController untuk merender halaman Laravel
- Responsif dan bisa dijalankan di iPhone/iPad

## Teknologi

- Laravel (untuk backend dan frontend)
- Swift (untuk aplikasi iOS)
- Xcode (untuk build dan deployment iOS)
- WebView (untuk menampilkan situs Laravel)

## Instalasi

1. Clone repositori iOS ini:
   ```bash
   git clone https://github.com/username/annme-ios.git
   cd annme-ios
   ```
2. Buka file .xcodeproj atau .xcworkspace di Xcode:
   ```
    open Annme.xcodeproj
3. Pastikan URL Laravel sudah sesuai di file ViewController.swift:
   ```
    let url = URL(string: "https://annme-money-main-bqtexi.laravel.cloud")!

## Kontribusi

1. Fork repo ini
2. Buat branch baru (git checkout -b fitur-baru)
3. Commit perubahan kamu (git commit -am 'Tambah fitur')
4. Push ke branch (git push origin fitur-baru)
5. Buat Pull Request
