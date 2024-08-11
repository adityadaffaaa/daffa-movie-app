import 'package:daffa_movie_app/app/modules/main_screen/bindings/main_screen_binding.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/bindings/movie_detail_binding.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/views/movie_detail_view.dart';

import 'package:get/get.dart';

import '../modules/main_screen/views/main_screen_view.dart';

part 'app_routes.dart';

/// Kelas [AppPages] mendefinisikan rute-rute yang tersedia dalam aplikasi.
///
/// Rute-rute ini termasuk pengaturan halaman atau tampilan dan transisi untuk navigasi di dalam
/// aplikasi. [AppPages] bertanggung jawab untuk menyediakan rute-rute yang akan
/// digunakan oleh GetX untuk navigasi dan pengelolaan halaman.
class AppPages {
  AppPages._();

  /// Rute awal aplikasi yang ditetapkan sebagai [Routes.MAIN].
  static const String INITIAL = Routes.MAIN;

  /// Rute untuk halaman detail film yang ditetapkan sebagai [Routes.MOVIE_DETAIL].
  static const String MOVIE_DETAIL = Routes.MOVIE_DETAIL;

  /// Daftar halaman yang tersedia dalam aplikasi, termasuk pengaturan halaman,
  /// pengikatan, dan transisi untuk setiap rute.
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    /// Rute untuk tampilan utama aplikasi
    GetPage<MainScreenView>(
      name: _Paths.MAIN,
      page: MainScreenView.new,
      binding: MainScreenBinding(),
      transition: Transition.leftToRight,
    ),

    /// Rute untuk halaman detail film
    GetPage<MovieDetailView>(
      name: _Paths.MOVIE_DETAIL,
      page: MovieDetailView.new,
      binding: MovieDetailBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
