import 'package:daffa_movie_app/app/api/exceptions.dart';

import 'package:daffa_movie_app/app/data/models/response/add_movie_response.dart';

import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_service.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_user_service.dart';
import 'package:daffa_movie_app/utils/extensions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// [WatchlistPageController] adalah controller yang mengelola daftar tonton
/// pengguna dalam aplikasi. Controller ini berfungsi untuk menambah atau
/// menghapus film dari daftar tonton dan memuat film yang ada dalam daftar tonton.
///
/// Controller ini juga mengelola status loading dan menyimpan log untuk debugging.
class WatchlistPageController extends GetxController {
  /// Layanan untuk berkomunikasi dengan API Movie DB.
  final MovieDbService movieDbService = MovieDbService();

  /// Layanan untuk berkomunikasi dengan API Movie DB terkait pengguna.
  final MovieDbUserService movieDbUserService = MovieDbUserService();

  /// Status loading untuk operasi umum.
  final RxBool isLoading = RxBool(true);

  /// Status loading khusus untuk genre.
  final RxBool genreIsLoading = RxBool(true);

  /// Logger untuk mencatat pesan debug dan error.
  final Logger logger = Logger();

  /// Daftar film dalam daftar tonton pengguna.
  final RxList<MovieResult> watchListMovie = RxList<MovieResult>(
    <MovieResult>[],
  );

  /// Menambahkan atau menghapus film dari daftar tonton pengguna.
  ///
  /// [mediaId] adalah ID film yang akan ditambahkan atau dihapus dari daftar tonton.
  /// [isAdd] menentukan apakah film harus ditambahkan (true) atau dihapus (false).
  Future<bool> handleAddToWatchList(
    final int mediaId, {
    final bool isAdd = true,
  }) async {
    try {
      final AddMovieResponse response =
          await movieDbUserService.addWatchList(mediaId, add: isAdd);
      Logger().i(response.toJson());
      final String strConditions = isAdd ? 'Adding' : 'Remove';
      if (response.success) {
        Get.snackbar(
          'Success $strConditions',
          '$strConditions movie to watchlist',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        if (!isAdd) {
          watchListMovie
              .removeWhere((final MovieResult item) => item.id == mediaId);
        } else {
          await fetchWatchlistMovies();
        }
      }
      return true;
    } catch (e) {
      logger.e('Add to watchlist failed $e');
    }
    return false;
  }

  /// Mengambil film yang ada dalam daftar tonton pengguna dari API dan memperbarui
  /// daftar tonton lokal.
  Future<void> fetchWatchlistMovies() async {
    try {
      final MovieItemResponse data = await movieDbUserService.getWatchList();

      for (final MovieResult e in data.results) {
        final bool isAlreadyInWatchList =
            watchListMovie.any((final MovieResult item) => item.id == e.id);

        if (!isAlreadyInWatchList) {
          final bool isSaved =
              await saveImageToLocalStorage(e.posterPath, imageId: e.id);

          if (isSaved) watchListMovie.add(e);
        }
      }
    } catch (e) {
      OtherException('Fetch watchlist movies failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchWatchlistMovies();
  }
}
