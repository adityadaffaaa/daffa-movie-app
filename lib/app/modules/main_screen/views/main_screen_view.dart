import 'package:daffa_movie_app/app/modules/main_screen/controllers/main_screen_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [MainScreenView] adalah widget tampilan utama aplikasi yang menampilkan konten
/// berdasarkan halaman aktif di navigasi bawah.
///
/// Widget ini menggunakan `GetResponsiveView` untuk memberikan dukungan tata letak
/// yang responsif, serta mengikat ke [MainScreenController] untuk mengelola state
/// dan menampilkan konten yang sesuai. `MainScreenView` mengelola tampilan utama
/// aplikasi, termasuk `AppBar`, konten halaman saat ini, dan `BottomNavbar`.
class MainScreenView extends GetResponsiveView<MainScreenController> {
  /// Konstruktor untuk membuat instance dari [MainScreenView].
  MainScreenView({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Scaffold(
          appBar: controller.appBar,
          body: SafeArea(
            child: controller.pages[controller.currentIdx].page,
          ),
          bottomNavigationBar: const BottomNavbarApp(),
        ),
      );
}
