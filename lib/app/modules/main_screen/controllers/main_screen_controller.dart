import 'package:daffa_movie_app/app/data/models/others/bottom_nav_page_item.dart';
import 'package:daffa_movie_app/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Controller utama untuk layar utama aplikasi.
///
/// [MainScreenController] berfungsi sebagai penghubung antara
/// [BottomNavbarAppController] dan bagian UI yang membutuhkan
/// data dari navigasi bawah serta pengaturan AppBar. Controller ini
/// mengelola status halaman aktif dan menentukan jenis AppBar yang
/// akan ditampilkan berdasarkan halaman aktif.
class MainScreenController extends GetxController {
  /// Controller untuk navigasi bar bawah.
  ///
  /// [BottomNavbarAppController] digunakan untuk mengakses dan
  /// mengelola data navigasi bar bawah, termasuk daftar halaman
  /// dan indeks halaman aktif.
  final BottomNavbarAppController _bottomNavbarAppController =
      Get.find<BottomNavbarAppController>();

  /// Daftar item halaman yang ditampilkan di navigasi bar bawah.
  ///
  /// Mendapatkan daftar item dari [BottomNavbarAppController] untuk
  /// digunakan dalam tampilan.
  List<BottomNavPageItem> get pages => _bottomNavbarAppController.pages;

  /// Indeks halaman saat ini yang sedang aktif.
  ///
  /// Mendapatkan indeks halaman aktif dari [BottomNavbarAppController].
  int get currentIdx => _bottomNavbarAppController.currentIdx.value;

  /// Mengatur indeks halaman aktif.
  ///
  /// Parameter [idx] adalah indeks halaman yang akan diatur sebagai
  /// halaman aktif. Metode ini memperbarui [currentIdx] di
  /// `BottomNavbarAppController`.
  void setCurrentIdx(final int idx) {
    _bottomNavbarAppController.currentIdx.value = idx;
  }

  /// Mendapatkan widget AppBar yang sesuai berdasarkan halaman aktif.
  PreferredSizeWidget? get appBar => appBarConditions();

  /// Menentukan jenis AppBar yang akan ditampilkan berdasarkan
  /// halaman aktif.
  ///
  /// Mengembalikan [MovieListAppBar] jika halaman aktif adalah
  /// [Favorite] atau [Watchlist]. [HomeAppBar] jika halaman aktif
  /// adalah [Home]. Dan `null` jika halaman aktif tidak memerlukan
  /// AppBar khusus.
  PreferredSizeWidget? appBarConditions() {
    final PreferredSizeWidget? appBar = currentIdx == 1 || currentIdx == 2
        ? MovieListAppBar(title: pages[currentIdx].title)
        : currentIdx == 0
            ? const HomeAppBar()
            : null;

    return appBar;
  }
}
