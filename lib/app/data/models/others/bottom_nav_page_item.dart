import 'package:flutter/material.dart';

/// `BottomNavPageItem` adalah kelas model yang digunakan untuk merepresentasikan
/// item pada navigasi bawah (bottom navigation).
///
/// Setiap item pada navigasi bawah memiliki judul (`title`), ikon default (`icon`),
/// ikon aktif (`activeIcon`), dan halaman (`page`) yang akan ditampilkan saat item
/// dipilih.
///
/// Contoh penggunaan:
///
/// ```dart
/// BottomNavPageItem homeItem = BottomNavPageItem(
///   title: 'Home',
///   icon: const Icon(
///   IconlyLight.home,
///   ),
///   activeIcon:  const Icon(
///     IconlyBold.home,
///  ),
///   page: HomePage(),
/// );
/// ```
class BottomNavPageItem {
  /// Judul dari item navigasi bawah.
  String title;

  /// Ikon yang akan ditampilkan saat item tidak aktif.
  Icon icon;

  /// Ikon yang akan ditampilkan saat item aktif.
  Icon activeIcon;

  /// Halaman yang akan ditampilkan ketika item dipilih.
  Widget page;

  /// Konstruktor untuk `BottomNavPageItem`.
  ///
  /// [title] adalah judul dari item navigasi bawah dan bersifat wajib.
  /// [icon] adalah ikon yang akan ditampilkan saat item tidak aktif dan bersifat wajib.
  /// [activeIcon] adalah ikon yang akan ditampilkan saat item aktif dan bersifat wajib.
  /// [page] adalah halaman yang akan ditampilkan saat item dipilih dan bersifat wajib.
  BottomNavPageItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
    required this.page,
  });
}
