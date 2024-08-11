import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/now_playing_controller.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/popular_controller.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/promotion_carousel_controller.dart';
import 'package:daffa_movie_app/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:daffa_movie_app/app/modules/profile/controllers/b_sheet_setting_controller.dart';
import 'package:daffa_movie_app/app/modules/profile/controllers/favorite_controller.dart';

import 'package:daffa_movie_app/app/modules/profile/controllers/watchlist_controller.dart';
import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_screen_controller.dart';

/// `MainScreenBinding` bertanggung jawab untuk mengelola pengaturan dependensi
/// yang diperlukan untuk layar utama aplikasi.
///
/// Dengan menggunakan GetX, kelas ini mendaftarkan berbagai controller yang akan
/// digunakan di aplikasi, memastikan bahwa semua dependensi diinisialisasi dan
/// tersedia ketika dibutuhkan.
///
/// Metode `dependencies` digunakan untuk mendaftarkan controller dengan GetX
/// sehingga dapat diakses oleh widget yang membutuhkan.
///
/// Berikut adalah daftar controller yang didaftarkan:
/// - [MainScreenController]: Mengelola logika untuk layar utama.
/// - [BottomNavbarAppController]: Mengelola status dan logika untuk navigasi bawah.
/// - [PromotionCarouselController]: Mengelola logika carousel promosi.
/// - [NowPlayingController]: Mengelola data dan logika untuk bagian "Now Playing".
/// - [PopularController]: Mengelola data dan logika untuk bagian "Popular".
/// - [WatchlistController]: Mengelola daftar film yang ditonton.
/// - [FavoriteController]: Mengelola daftar film favorit.
/// - [BSheetSettingController]: Mengelola pengaturan untuk bottom sheet.
/// - [FavoritePageController]: Mengelola data dan logika untuk halaman favorit.
/// - [WatchlistPageController]: Mengelola data dan logika untuk halaman daftar tonton.
class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    /// Mendaftarkan [MainScreenController] dengan GetX.
    /// Controller ini mengelola logika untuk layar utama aplikasi.
    Get.lazyPut<MainScreenController>(
      MainScreenController.new,
    );

    /// Mendaftarkan [BottomNavbarAppController] dengan GetX.
    /// Controller ini mengelola status dan logika navigasi bawah aplikasi.
    Get.lazyPut<BottomNavbarAppController>(
      BottomNavbarAppController.new,
    );

    /// Mendaftarkan [PromotionCarouselController] dengan GetX.
    /// Controller ini mengelola logika untuk carousel promosi di layar utama.
    Get.lazyPut<PromotionCarouselController>(
      PromotionCarouselController.new,
    );

    /// Mendaftarkan [NowPlayingController] dengan GetX.
    /// Controller ini mengelola data dan logika untuk bagian "Now Playing".
    Get.lazyPut<NowPlayingController>(
      NowPlayingController.new,
    );

    /// Mendaftarkan [PopularController] dengan GetX.
    /// Controller ini mengelola data dan logika untuk bagian "Popular".
    Get.lazyPut<PopularController>(
      PopularController.new,
    );

    /// Mendaftarkan [WatchlistController] dengan GetX.
    /// Controller ini mengelola daftar film yang ditonton oleh pengguna.
    Get.lazyPut<WatchlistController>(
      WatchlistController.new,
    );

    /// Mendaftarkan [FavoriteController] dengan GetX.
    /// Controller ini mengelola daftar film favorit pengguna.
    Get.lazyPut<FavoriteController>(
      FavoriteController.new,
    );

    /// Mendaftarkan [BSheetSettingController] dengan GetX.
    /// Controller ini mengelola pengaturan untuk bottom sheet.
    Get.lazyPut<BSheetSettingController>(
      BSheetSettingController.new,
    );

    /// Mendaftarkan [FavoritePageController] dengan GetX.
    /// Controller ini mengelola data dan logika untuk halaman favorit.
    Get.lazyPut<FavoritePageController>(
      FavoritePageController.new,
    );

    /// Mendaftarkan [WatchlistPageController] dengan GetX.
    /// Controller ini mengelola data dan logika untuk halaman daftar tonton.
    Get.lazyPut<WatchlistPageController>(
      WatchlistPageController.new,
    );
  }
}
