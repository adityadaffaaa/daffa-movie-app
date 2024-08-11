import 'package:daffa_movie_app/app/modules/main_screen/controllers/main_screen_controller.dart';
import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [WatchlistController] mengelola logika dan state yang terkait dengan
///  watchlist section dalam aplikasi. Controller ini menyediakan akses ke
/// kontrol gulir dan mengelola interaksi dengan [WatchlistPageController]
/// dan [MainScreenController].
class WatchlistController extends GetxController {
  /// Kontroler untuk mengelola scroll pada watchlist section.
  final ScrollController scrollController = ScrollController();

  /// Controller untuk halaman watchlist, diambil dari dependensi GetX.
  final WatchlistPageController watchlistPageController =
      Get.find<WatchlistPageController>();

  /// Controller untuk layar utama aplikasi, diambil dari dependensi GetX.
  final MainScreenController mainScreenController =
      Get.find<MainScreenController>();
}
