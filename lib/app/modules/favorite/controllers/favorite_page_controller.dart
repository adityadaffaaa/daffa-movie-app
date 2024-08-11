import 'package:daffa_movie_app/app/api/exceptions.dart';
import 'package:daffa_movie_app/app/data/models/response/add_movie_response.dart';

import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_service.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_user_service.dart';
import 'package:daffa_movie_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// [FavoritePageController] adalah controller yang mengelola logika bisnis
/// terkait halaman favorit dalam aplikasi.
///
/// Controller ini bertanggung jawab untuk menangani penambahan dan penghapusan
/// film dari daftar favorit pengguna, serta memuat data film favorit dari
/// layanan MovieDbUserService.
class FavoritePageController extends GetxController {
  /// [movieDbService] adalah instance dari [MovieDbService] yang digunakan
  /// untuk berinteraksi dengan API film yang tersedia.
  final MovieDbService movieDbService = MovieDbService();

  /// [movieDbUserService] adalah instance dari [MovieDbUserService] yang digunakan
  /// untuk berinteraksi dengan API yang berkaitan dengan pengguna, seperti favorit dan watchlist.
  final MovieDbUserService movieDbUserService = MovieDbUserService();

  /// [isLoading] adalah properti reaktif yang menunjukkan apakah data sedang dimuat.
  final RxBool isLoading = RxBool(true);

  /// [genreIsLoading] adalah properti reaktif yang menunjukkan apakah data genre sedang dimuat.
  final RxBool genreIsLoading = RxBool(true);

  /// [logger] adalah instance dari [Logger] yang digunakan untuk mencatat log debug dan error.
  final Logger logger = Logger();

  /// [favoriteMovies] adalah daftar reaktif yang menyimpan film favorit pengguna.
  final RxList<MovieResult> favoriteMovies =
      RxList<MovieResult>(<MovieResult>[]);

  /// Menangani penambahan atau penghapusan film dari daftar favorit.
  ///
  /// [mediaId] adalah ID film yang ingin ditambahkan atau dihapus.
  /// [isAdd] menentukan apakah film harus ditambahkan (true) atau dihapus (false) dari favorit.
  ///
  /// Mengembalikan `true` jika operasi berhasil, `false` jika gagal.
  Future<bool> handleAddToFavorite(
    final int mediaId, {
    final bool isAdd = true,
  }) async {
    try {
      final AddMovieResponse response =
          await movieDbUserService.addFavorite(mediaId, add: isAdd);
      final String strConditions = isAdd ? 'Adding' : 'Remove';
      Logger().i(response.toJson());
      if (response.success) {
        Get.snackbar(
          'Success $strConditions',
          '$strConditions movie to favorite',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        if (!isAdd) {
          favoriteMovies
              .removeWhere((final MovieResult item) => item.id == mediaId);
        } else {
          await fetchFavMovies();
        }
      }

      return true;
    } catch (e) {
      logger.e('Add to favorite failed $e');
    }
    return false;
  }

  /// Mengambil daftar film favorit pengguna dari API dan menambahkannya ke [favoriteMovies].
  Future<void> fetchFavMovies() async {
    try {
      final MovieItemResponse data = await movieDbUserService.getFavorite();

      for (final MovieResult e in data.results) {
        final bool isAlreadyInFavoriteMovies =
            favoriteMovies.any((final MovieResult item) => item.id == e.id);

        if (!isAlreadyInFavoriteMovies) {
          final bool isSaved =
              await saveImageToLocalStorage(e.posterPath, imageId: e.id);

          if (isSaved) favoriteMovies.add(e);
        }
      }
    } catch (e) {
      OtherException('Fetch favorite movies failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Metode yang dipanggil saat controller diinisialisasi.
  ///
  /// Memulai proses pengambilan film favorit dari API.
  @override
  void onInit() {
    super.onInit();
    fetchFavMovies();
  }
}
