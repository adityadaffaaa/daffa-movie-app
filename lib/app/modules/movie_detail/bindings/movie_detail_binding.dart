import 'package:daffa_movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:get/get.dart';

/// [MovieDetailBinding] adalah binding yang mengelola ketergantungan
/// untuk modul detail film.
///
/// Binding ini mengatur penyediaan instance [MovieDetailController] menggunakan
/// GetX, memastikan bahwa controller ini tersedia secara lazim di seluruh aplikasi
/// dan dapat digunakan dalam tampilan yang memerlukan detail film.
class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    /// Menyediakan instance dari [MovieDetailController] dengan cara
    /// lazy-loading, artinya instance ini akan dibuat hanya ketika pertama kali
    /// dibutuhkan.
    Get.lazyPut<MovieDetailController>(
      MovieDetailController.new,
    );
  }
}
