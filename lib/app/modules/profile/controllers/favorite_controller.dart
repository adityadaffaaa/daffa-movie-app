import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';
import 'package:daffa_movie_app/app/modules/main_screen/controllers/main_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [FavoriteController] mengelola logika dan state yang terkait dengan
///  favorit section dalam aplikasi. Controller ini menyediakan akses ke
/// kontrol gulir dan mengelola interaksi dengan [FavoritePageController]
/// dan [MainScreenController].
class FavoriteController extends GetxController {
  /// Kontroler untuk mengelola scroll favorite section.
  final ScrollController scrollController = ScrollController();

  /// Controller untuk halaman favorit, diambil dari dependensi GetX.
  final FavoritePageController favoritePageController =
      Get.find<FavoritePageController>();

  /// Controller untuk layar utama aplikasi, diambil dari dependensi GetX.
  final MainScreenController mainScreenController =
      Get.find<MainScreenController>();
}
