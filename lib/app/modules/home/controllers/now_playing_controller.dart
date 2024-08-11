import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daffa_movie_app/app/api/exceptions.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_service.dart';
import 'package:daffa_movie_app/app/enums/movie_type.enum.dart';
import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';

import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';
import 'package:daffa_movie_app/utils/extensions.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// Controller untuk mengelola logika bisnis dan state pada halaman
/// "Now Playing" di aplikasi.
///
/// [NowPlayingController] mengatur pengambilan data film yang sedang
/// tayang dari MovieDB API dan juga menangani operasi favorit dan watchlist.
class NowPlayingController extends GetxController {
  /// Instance [FavoritePageController] untuk mengelola operasi favorit.
  final FavoritePageController _favController =
      Get.find<FavoritePageController>();

  /// Instance [WatchlistPageController] untuk mengelola operasi watchlist.
  final WatchlistPageController _watchlistController =
      Get.find<WatchlistPageController>();

  /// Controller untuk mengelola Carousel Slider.
  final CarouselController carouselCtrl = CarouselController();

  /// Service untuk berkomunikasi dengan MovieDB API.
  final MovieDbService movieDbService = MovieDbService();

  /// Index dari item yang sedang ditampilkan di Carousel.
  RxInt carouselIdx = RxInt(0);

  /// State untuk menandakan apakah data sedang di-load.
  RxBool isLoading = RxBool(true);

  /// Logger untuk mencatat informasi dan error.
  Logger logger = Logger();

  /// List film yang sedang tayang yang diperoleh dari API.
  RxList<MovieResult> nowPlayingItems = RxList<MovieResult>(
    <MovieResult>[],
  );

  /// Getter untuk instance [FavoritePageController].
  FavoritePageController get favCtrl => _favController;

  /// Getter untuk instance [WatchlistPageController].
  WatchlistPageController get watchlistCtrl => _watchlistController;

  /// Mengubah halaman di Carousel sesuai index yang diberikan.
  void changePage(final int idx) {
    carouselIdx.value = idx;
  }

  /// Mengambil data film yang sedang tayang dari MovieDB API.
  ///
  /// Film yang diperoleh akan disimpan ke [nowPlayingItems] setelah
  /// gambar poster disimpan ke local storage.
  Future<void> fetchNowPlayingMovie() async {
    try {
      final MovieItemResponse data = await movieDbService.getMovie(
        MovieTypeEnum.nowPlaying,
      );

      for (final MovieResult e in data.results) {
        final bool isSaved =
            await saveImageToLocalStorage(e.posterPath, imageId: e.id);

        if (isSaved) nowPlayingItems.add(e);
      }
    } catch (e) {
      isLoading.value = false;
      logger.e('Fetch now playing movie failed: $e');
      throw OtherException('Fetch now playing movie failed: $e');
    }
  }

  /// Menangani pemeriksaan apakah film yang sedang tayang sudah ada di
  /// daftar favorit atau watchlist.
  void handleFavAndWatchListMovieCheck() {
    try {
      favCtrl.favoriteMovies.listen(
        (final List<MovieResult> item) {
          final List<MovieResult> favMovies = favCtrl.favoriteMovies;
          List<int> favMovieId = <int>[];
          if (favMovies.isNotEmpty && nowPlayingItems.isNotEmpty) {
            for (int i = 0; i < favMovies.length; i++) {
              favMovieId.add(favMovies[i].id);
            }

            for (int i = 0; i < nowPlayingItems.length; i++) {
              if (favMovieId.toSet().contains(nowPlayingItems[i].id)) {
                nowPlayingItems[i].isFavorite = true;
              }
            }
            nowPlayingItems.refresh();
          }
        },
      );

      watchlistCtrl.watchListMovie.listen(
        (final List<MovieResult> item) async {
          final List<MovieResult> watchListMovie = watchlistCtrl.watchListMovie;
          List<int> watchListMovieId = <int>[];

          if (watchListMovie.isNotEmpty && nowPlayingItems.isNotEmpty) {
            for (int i = 0; i < watchListMovie.length; i++) {
              watchListMovieId.add(watchListMovie[i].id);
            }

            for (int i = 0; i < nowPlayingItems.length; i++) {
              if (watchListMovieId.toSet().contains(nowPlayingItems[i].id)) {
                nowPlayingItems[i].isWatchlist = true;
              }
            }
            nowPlayingItems.refresh();
          }
        },
      );
    } catch (e) {
      logger.e('Handle favorite and watch list movie check failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Menambahkan atau menghapus film dari daftar favorit.
  ///
  /// Film dengan [id] yang diberikan akan ditambahkan ke atau dihapus dari
  /// daftar favorit, tergantung pada nilai [isAdd].
  Future<void> handleFavorite(
    final int id, {
    final bool isAdd = true,
  }) async {
    final bool isSuccess = await favCtrl.handleAddToFavorite(id, isAdd: isAdd);

    if (isSuccess) {
      nowPlayingItems
          .where((final MovieResult item) => item.id == id)
          .toList()[0]
          .isFavorite = isAdd;
      nowPlayingItems.refresh();
    }
  }

  /// Menambahkan atau menghapus film dari daftar watchlist.
  ///
  /// Film dengan [id] yang diberikan akan ditambahkan ke atau dihapus dari
  /// daftar watchlist, tergantung pada nilai [isAdd].
  Future<void> handleWatchList(
    final int id, {
    final bool isAdd = true,
  }) async {
    final bool isSuccess =
        await watchlistCtrl.handleAddToWatchList(id, isAdd: isAdd);

    if (isSuccess) {
      nowPlayingItems
          .where((final MovieResult item) => item.id == id)
          .toList()[0]
          .isWatchlist = isAdd;
      nowPlayingItems.refresh();
    }
  }

  /// Dipanggil ketika controller diinisialisasi.
  ///
  /// [onInit] akan memanggil [fetchNowPlayingMovie] untuk mengambil data film
  /// yang sedang tayang, kemudian memeriksa apakah film tersebut ada di
  /// daftar favorit atau watchlist.
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchNowPlayingMovie();
    handleFavAndWatchListMovieCheck();
  }
}
