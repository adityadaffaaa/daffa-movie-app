import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  /// Fungsi utama aplikasi.
  ///
  /// Menjalankan aplikasi dengan widget [MyApp] sebagai root widget.
  runApp(const MyApp());
}

/// Widget utama aplikasi.
///
/// Menggunakan [GetMaterialApp] dari package GetX untuk menyediakan fitur-fitur tambahan seperti routing dan state management.
class MyApp extends StatelessWidget {
  /// Konstruktor untuk [MyApp].
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        /// Judul aplikasi yang akan ditampilkan pada taskbar atau launcher.
        title: 'Daffa Movie App',

        /// Rute awal aplikasi yang akan diakses saat aplikasi pertama kali dibuka.
        initialRoute: AppPages.INITIAL,

        /// Daftar rute yang didefinisikan untuk navigasi aplikasi.
        getPages: AppPages.routes,

        /// Menonaktifkan banner debug yang biasanya ditampilkan di sudut kanan atas aplikasi saat debug mode.
        debugShowCheckedModeBanner: false,
      );
}
