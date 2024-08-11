import 'package:daffa_movie_app/app/data/models/others/bottom_nav_page_item.dart';
import 'package:daffa_movie_app/app/modules/favorite/views/favorite_view.dart';
import 'package:daffa_movie_app/app/modules/home/views/home_view.dart';
import 'package:daffa_movie_app/app/modules/profile/views/profile_view.dart';
import 'package:daffa_movie_app/app/modules/watchlist/views/watchlist_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

/// Controller untuk mengelola navigasi bar bawah aplikasi.
///
/// [BottomNavbarAppController] menangani status dan data untuk
/// navigasi bar bawah di aplikasi. Ini menyimpan indeks halaman
/// yang sedang aktif serta daftar item navigasi.
///
/// Controller ini menggunakan `GetX` untuk mengelola status dan
/// pembaruan UI terkait navigasi bar bawah.
class BottomNavbarAppController extends GetxController {
  /// Indeks halaman saat ini yang sedang aktif.
  ///
  /// Indeks ini digunakan untuk menentukan halaman mana yang
  /// ditampilkan di tampilan navigasi bawah. Nilai defaultnya adalah 0.
  RxInt currentIdx = RxInt(0);

  /// Daftar item navigasi bar bawah.
  ///
  /// Daftar ini terdiri dari [BottomNavPageItem] yang berisi
  /// judul halaman, ikon aktif dan tidak aktif, serta halaman
  /// yang ditampilkan saat item tersebut dipilih.
  final List<BottomNavPageItem> pages = <BottomNavPageItem>[
    BottomNavPageItem(
      title: 'Home',
      icon: const Icon(
        IconlyLight.home,
      ),
      activeIcon: const Icon(
        IconlyBold.home,
      ),
      page: const HomeView(),
    ),
    BottomNavPageItem(
      title: 'Favorite',
      icon: const Icon(
        IconlyLight.heart,
      ),
      activeIcon: const Icon(
        IconlyBold.heart,
      ),
      page: const FavoriteView(),
    ),
    BottomNavPageItem(
      title: 'Watchlist',
      icon: const Icon(
        IconlyLight.bookmark,
      ),
      activeIcon: const Icon(
        IconlyBold.bookmark,
      ),
      page: const WatchlistView(),
    ),
    BottomNavPageItem(
      title: 'Profile',
      icon: const Icon(
        IconlyLight.profile,
      ),
      activeIcon: const Icon(
        IconlyBold.profile,
      ),
      page: const ProfileView(),
    ),
  ];

  /// Mengubah indeks halaman yang aktif.
  ///
  /// Parameter [idx] adalah indeks baru yang akan diatur sebagai
  /// halaman aktif. Metode ini memperbarui `currentIdx` dengan
  /// nilai baru dan memicu pembaruan UI jika diperlukan.
  void onChange(final int idx) {
    currentIdx.value = idx;
  }
}
