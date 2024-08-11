import 'package:daffa_movie_app/app/api/exceptions.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/data/services/movie_db_service.dart';
import 'package:daffa_movie_app/app/enums/movie_type.enum.dart';
import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';
import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';
import 'package:daffa_movie_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// Controller untuk mengelola logika bisnis dan state pada halaman
/// "Popular Movies" di aplikasi.
///
/// [PopularController] mengatur pengambilan data film populer dari MovieDB API
/// dan menangani operasi favorit serta watchlist.
class PopularController extends GetxController {
  /// Instance [FavoritePageController] untuk mengelola operasi favorit.
  final FavoritePageController _favController =
      Get.find<FavoritePageController>();

  /// Instance [WatchlistPageController] untuk mengelola operasi watchlist.
  final WatchlistPageController _watchlistController =
      Get.find<WatchlistPageController>();

  /// Controller untuk mengelola scrolling di halaman.
  final ScrollController scrollController = ScrollController();

  /// Service untuk berkomunikasi dengan MovieDB API.
  final MovieDbService movieDbService = MovieDbService();

  /// State untuk menandakan apakah data sedang di-load.
  RxBool isLoading = RxBool(true);

  /// Logger untuk mencatat informasi dan error.
  Logger logger = Logger();

  /// List film populer yang diperoleh dari API.
  RxList<MovieResult> popularMovieItems = RxList<MovieResult>(
    <MovieResult>[],
  );

  /// Getter untuk instance [FavoritePageController].
  FavoritePageController get favCtrl => _favController;

  /// Getter untuk instance [WatchlistPageController].
  WatchlistPageController get watchlistCtrl => _watchlistController;

  /// Mengambil data film populer dari MovieDB API.
  ///
  /// Film yang diperoleh akan disimpan ke [popularMovieItems] setelah
  /// gambar poster disimpan ke local storage.
  Future<void> fetchPopularMovie() async {
    try {
      final MovieItemResponse data = await movieDbService.getMovie(
        MovieTypeEnum.popular,
      );

      for (final MovieResult e in data.results) {
        final bool isSaved =
            await saveImageToLocalStorage(e.posterPath, imageId: e.id);

        if (isSaved) popularMovieItems.add(e);
      }
    } catch (e) {
      isLoading.value = false;
      logger.e('Fetch popular movie failed: $e');
      throw OtherException('Fetch popular movie failed: $e');
    }
  }

  /// Menangani pemeriksaan apakah film populer sudah ada di
  /// daftar favorit atau watchlist.
  void handleFavAndWatchListMovieCheck() {
    try {
      favCtrl.favoriteMovies.listen(
        (final List<MovieResult> item) {
          final List<MovieResult> favMovies = favCtrl.favoriteMovies;
          List<int> favMovieId = <int>[];
          if (favMovies.isNotEmpty && popularMovieItems.isNotEmpty) {
            for (int i = 0; i < favMovies.length; i++) {
              favMovieId.add(favMovies[i].id);
            }

            for (int i = 0; i < popularMovieItems.length; i++) {
              if (favMovieId.toSet().contains(popularMovieItems[i].id)) {
                popularMovieItems[i].isFavorite = true;
              }
            }
            popularMovieItems.refresh();
          }
        },
      );

      watchlistCtrl.watchListMovie.listen(
        (final List<MovieResult> item) {
          final List<MovieResult> watchListMovie = watchlistCtrl.watchListMovie;
          List<int> watchListMovieId = <int>[];

          if (watchListMovie.isNotEmpty && popularMovieItems.isNotEmpty) {
            for (int i = 0; i < watchListMovie.length; i++) {
              watchListMovieId.add(watchListMovie[i].id);
            }

            for (int i = 0; i < popularMovieItems.length; i++) {
              if (watchListMovieId.toSet().contains(popularMovieItems[i].id)) {
                popularMovieItems[i].isWatchlist = true;
              }
            }
            popularMovieItems.refresh();
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
      popularMovieItems
          .where((final MovieResult item) => item.id == id)
          .toList()[0]
          .isFavorite = isAdd;
      popularMovieItems.refresh();
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
      popularMovieItems
          .where((final MovieResult item) => item.id == id)
          .toList()[0]
          .isWatchlist = isAdd;
      popularMovieItems.refresh();
    }
  }

  /// Dipanggil ketika controller diinisialisasi.
  ///
  /// [onInit] akan memanggil [fetchPopularMovie] untuk mengambil data film
  /// populer, kemudian memeriksa apakah film tersebut ada di
  /// daftar favorit atau watchlist.
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchPopularMovie();
    handleFavAndWatchListMovieCheck();
    update();
  }
}
