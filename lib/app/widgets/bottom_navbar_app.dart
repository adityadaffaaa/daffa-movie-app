import 'package:daffa_movie_app/app/data/models/others/bottom_nav_page_item.dart';
import 'package:daffa_movie_app/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// Widget [BottomNavbarApp] adalah bilah navigasi bawah yang digunakan untuk
/// navigasi antar halaman utama dalam aplikasi.
///
/// Bilah navigasi ini menggunakan [BottomNavigationBar] dan dihubungkan dengan
/// [BottomNavbarAppController] untuk mengelola status aktif halaman dan perubahan
/// navigasi. Widget ini juga mengonfigurasi gaya visual untuk item navigasi.
class BottomNavbarApp extends StatelessWidget {
  /// Konstruktor untuk kelas [BottomNavbarApp].
  /// Tidak memerlukan parameter tambahan.
  const BottomNavbarApp({super.key});

  @override
  Widget build(final BuildContext context) => GetX<BottomNavbarAppController>(
        builder: (final BottomNavbarAppController ctrl) => BottomNavigationBar(
          backgroundColor: app_color.neutral950,
          currentIndex: ctrl.currentIdx.value,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: const IconThemeData(
            color: app_color.white,
          ),
          unselectedLabelStyle: app_typo.paragraph4.copyWith(
            fontSize: 8,
          ),
          selectedLabelStyle: app_typo.paragraph4.copyWith(
            fontSize: 8,
          ),
          selectedItemColor: app_color.yellow300,
          unselectedItemColor: app_color.white,
          onTap: ctrl.onChange,
          items: ctrl.pages
              .map(
                (final BottomNavPageItem item) => BottomNavigationBarItem(
                  icon: item.icon,
                  label: item.title,
                  activeIcon: item.activeIcon,
                ),
              )
              .toList(),
        ),
      );
}
