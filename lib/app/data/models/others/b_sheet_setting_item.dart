import 'package:flutter/material.dart';

/// `BSheetSettingItem` adalah kelas model yang digunakan untuk merepresentasikan
/// sebuah item setting dalam Bottom Sheet.
///
/// Setiap item memiliki judul (`title`) dan ikon (`icon`) yang akan ditampilkan
/// pada UI.
///
/// Contoh penggunaan:
///
/// ```dart
/// BSheetSettingItem item = BSheetSettingItem(
///   title: 'Language',
///   icon: IconlyLight.arrow_right_2,
/// );
/// ```
class BSheetSettingItem {
  /// Judul dari item setting yang akan ditampilkan.
  String title;

  /// Ikon yang akan ditampilkan bersama dengan judul item setting.
  IconData icon;

  /// Konstruktor untuk `BSheetSettingItem`.
  ///
  /// [title] adalah judul dari item pengaturan dan bersifat wajib.
  /// [icon] adalah ikon yang akan digunakan untuk item pengaturan dan bersifat wajib.
  BSheetSettingItem({
    required this.title,
    required this.icon,
  });
}
