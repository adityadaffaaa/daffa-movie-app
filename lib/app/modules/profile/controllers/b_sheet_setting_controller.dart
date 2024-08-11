import 'package:daffa_movie_app/app/data/models/others/b_sheet_setting_item.dart';
import 'package:daffa_movie_app/app/modules/main_screen/controllers/main_screen_controller.dart';
import 'package:daffa_movie_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [BSheetSettingController] adalah controller untuk mengelola pengaturan yang
/// ditampilkan dalam bottom sheet (lembar pengaturan) pada aplikasi.
/// Controller ini memuat daftar item pengaturan dan mengelola interaksi dengan
/// [MainScreenController].
class BSheetSettingController extends GetxController {
  /// Daftar item pengaturan yang ditampilkan dalam bottom sheet.
  /// Menggunakan data dari [settingMenus] dan mengonversinya menjadi
  /// daftar [BSheetSettingItem].
  final List<BSheetSettingItem> menus = settingMenus
      .map(
        (final Map<String, dynamic> item) => BSheetSettingItem(
          title: item['title'] as String,
          icon: item['icon'] as IconData,
        ),
      )
      .toList();

  /// Controller untuk layar utama aplikasi, diambil dari dependensi GetX.
  final MainScreenController mainScreenController =
      Get.find<MainScreenController>();
}
