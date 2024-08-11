import 'package:daffa_movie_app/app/api/exceptions.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_credit_response.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_genre_response.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_service.dart';
import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';
import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';
import 'package:daffa_movie_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// [MovieDetailController] adalah controller untuk mengelola data dan
/// logika bisnis terkait detail film.
///
/// Controller ini bertanggung jawab untuk mengambil data detail film,
/// daftar genre, kredit film, dan film serupa. Selain itu, controller ini
/// juga menangani tindakan terkait favorit dan daftar tonton.
class MovieDetailController extends GetxController {
  /// Instance [FavoritePageController] untuk mengelola operasi _favController.
  final FavoritePageController _favController =
      Get.find<FavoritePageController>();

  /// Instance [WatchlistPageController] untuk mengelola operasi _watchlistController.
  final WatchlistPageController _watchlistController =
      Get.find<WatchlistPageController>();

  /// Service untuk berkomunikasi dengan MovieDB API.
  final MovieDbService movieDbService = MovieDbService();

  /// Controller untuk mengelola scrolling di halaman.
  final ScrollController scrollController = ScrollController();

  /// Menyimpan detail film yang sedang ditampilkan.
  late MovieResult getMovieDetail;

  /// Status untuk menentukan apakah informasi tentang film diperluas.
  final RxBool expandAbout = RxBool(false);

  /// Status loading untuk genre film.
  RxBool genreIsLoading = RxBool(true);

  /// Status loading untuk kredit film.
  RxBool castIsLoading = RxBool(true);

  /// Status loading untuk film serupa.
  RxBool similarIsLoading = RxBool(true);

  /// Logger untuk mencatat pesan log.
  Logger logger = Logger();

  /// Daftar aktor film.
  RxList<Cast> casts = RxList<Cast>(
    <Cast>[],
  );

  /// Daftar genre film.
  RxList<Genre> genres = RxList<Genre>(
    <Genre>[],
  );

  /// Daftar film serupa dengan film yang sedang ditampilkan.
  RxList<MovieResult> similar = RxList<MovieResult>(
    <MovieResult>[],
  );

  /// Mengambil daftar aktor dengan departemen 'Acting'.
  List<Cast> get getCast =>
      casts.where((final Cast item) => item.departMent == 'Acting').toList();

  /// Mengambil daftar genre film berdasarkan genre film yang sedang ditampilkan.
  List<Genre>? get movieDetailGenre => genres.isNotEmpty
      ? genres
          .where(
            (final Genre item) => getMovieDetail.genreIds.contains(item.id),
          )
          .toList()
      : <Genre>[];

  /// Mengambil instance [FavoritePageController].
  FavoritePageController get favCtrl => _favController;

  /// Mengambil instance [WatchlistPageController].
  WatchlistPageController get watchlistCtrl => _watchlistController;

  /// Mengambil daftar film serupa.
  List<MovieResult> get similarMovie => similar;

  /// Mengatur data detail film berdasarkan argumen yang diterima.
  void handleArgs() {
    final MovieResult data = Get.arguments as MovieResult;
    getMovieDetail = data;
  }

  /// Mengubah status perluasan informasi tentang film.
  void handleExpand() => expandAbout.value = !expandAbout.value;

  /// Mengambil data kredit film dari API.
  ///
  /// Jika berhasil, menambahkan data aktor ke daftar aktor. Jika gagal,
  /// mencatat pesan kesalahan dan melemparkan pengecualian.
  Future<void> fetchMovieCast(final int movieId) async {
    try {
      final MovieCreditResponse data = await movieDbService.getCredit(
        movieId,
      );

      casts.addAll(data.cast);
    } catch (e) {
      logger.e('Fetch movie cast failed: $e');
      throw OtherException('Fetch movie cast failed: $e');
    } finally {
      castIsLoading.value = false;
    }
  }

  /// Mengambil data genre film dari API.
  ///
  /// Jika berhasil, menambahkan data genre ke daftar genre. Jika gagal,
  /// mencatat pesan kesalahan dan melemparkan pengecualian.
  Future<void> fetchMovieGenre() async {
    try {
      final MovieGenreResponse data = await movieDbService.getGenre();

      genres.addAll(data.genres);
    } catch (e) {
      logger.e('Fetch movie genres failed: $e');
      throw OtherException('Fetch movie genres failed: $e');
    } finally {
      genreIsLoading.value = false;
    }
  }

  /// Menangani penambahan atau penghapusan film dari daftar favorit.
  ///
  /// Jika berhasil, memperbarui status film dalam daftar favorit.
  Future<void> handleFavorite(
    final int id, {
    final bool isAdd = true,
  }) async {
    final bool isSuccess = await favCtrl.handleAddToFavorite(id, isAdd: isAdd);

    if (isSuccess) {
      getMovieDetail.isFavorite = isAdd;
    }
  }

  /// Menangani penambahan atau penghapusan film dari daftar tonton.
  ///
  /// Jika berhasil, memperbarui status film dalam daftar tonton.
  Future<void> handleWatchList(
    final int id, {
    final bool isAdd = true,
  }) async {
    final bool isSuccess =
        await watchlistCtrl.handleAddToWatchList(id, isAdd: isAdd);

    if (isSuccess) {
      getMovieDetail.isWatchlist = isAdd;
    }
  }

  /// Mengambil data film serupa dari API.
  ///
  /// Jika berhasil, menyimpan gambar film serupa ke penyimpanan lokal dan
  /// menambahkan film ke daftar film serupa. Jika gagal, mencatat pesan
  /// kesalahan dan melemparkan pengecualian.
  Future<void> fetchSimilarMovie(final int movieId) async {
    try {
      final MovieItemResponse data = await movieDbService.getSimilar(
        movieId,
      );

      if (data.results.isNotEmpty) {
        for (final MovieResult e in data.results) {
          final bool isSaved =
              await saveImageToLocalStorage(e.posterPath, imageId: e.id);

          if (isSaved) similar.add(e);
        }
      }
    } catch (e) {
      logger.e('Fetch similar movie failed: $e');
      throw OtherException('Fetch similar movie failed: $e');
    } finally {
      similarIsLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    /// Menginisialisasi controller dengan mengambil argumen dan
    /// data genre film.
    super.onInit();
    handleArgs();
    fetchMovieGenre();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    /// Mengambil data kredit film dan film serupa setelah controller siap.
    super.onReady();
    fetchMovieCast(getMovieDetail.id);
    fetchSimilarMovie(getMovieDetail.id);
  }
}
