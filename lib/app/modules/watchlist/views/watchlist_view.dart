import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// Widget yang menampilkan daftar film dalam daftar tonton pengguna.
///
/// Widget ini menggunakan [WatchlistPageController] untuk mengelola data
/// dan status loading. Jika data masih dimuat, akan menampilkan indikator
/// loading. Jika daftar tonton kosong, akan menampilkan pesan "Watchlist is Empty!".
/// Jika ada film dalam daftar tonton, akan menampilkan daftar film dengan
/// opsi untuk menghapus film dari daftar tonton.
class WatchlistView extends GetView<WatchlistPageController> {
  /// Konstruktor untuk kelas [WatchlistView].
  const WatchlistView({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => MovieListLayout(
          content: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.watchListMovie.isEmpty
                  ? Center(
                      child: AutoSizeText(
                        'Watchlist is Empty !',
                        style: app_typo.paragraph4,
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (final _, final int idx) =>
                          const SizedBox(
                        height: 14,
                      ),
                      itemCount: controller.watchListMovie.length,
                      itemBuilder: (final _, final int idx) => MovieListCard(
                        item: controller.watchListMovie[idx],
                        onTap: () => controller.handleAddToWatchList(
                          controller.watchListMovie[idx].id,
                          isAdd: false,
                        ),
                      ),
                    ),
        ),
      );
}
