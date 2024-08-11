import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/modules/profile/controllers/watchlist_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// [WatchlistSection] adalah widget yang menampilkan daftar film yang ada di watchlist pengguna.
/// Jika watchlist kosong, menampilkan pesan yang menyatakan bahwa watchlist kosong.
/// Jika ada film di watchlist, menampilkan daftar horizontal dari poster film dalam watchlist.
///

class WatchlistSection extends GetView<WatchlistController> {
  /// Konstruktor untuk [WatchlistSection].
  const WatchlistSection({super.key});

  @override
  Widget build(final BuildContext context) => ContentLayout(
        title: 'Watchlist Movie',
        more: () {
          controller.mainScreenController.setCurrentIdx(2);
        },
        content: controller.watchlistPageController.watchListMovie.isEmpty
            ? Center(
                child: AutoSizeText(
                  'Watchlist is Empty !',
                  style: app_typo.paragraph4,
                ),
              )
            : AspectRatio(
                aspectRatio: 16 / 10,
                child: ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      controller.watchlistPageController.watchListMovie.length,
                  itemBuilder: (final _, final int idx) => AspectRatio(
                    aspectRatio: 5 / 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: controller.watchlistPageController.watchListMovie
                                    .last ==
                                controller
                                    .watchlistPageController.watchListMovie[idx]
                            ? 24
                            : 12,
                        left: controller.watchlistPageController.watchListMovie
                                    .first ==
                                controller
                                    .watchlistPageController.watchListMovie[idx]
                            ? 24
                            : 12,
                      ),
                      child: MoviePosterCard(
                        isHorizontal: true,
                        hideActionButton: true,
                        item: controller
                            .watchlistPageController.watchListMovie[idx],
                      ),
                    ),
                  ),
                ),
              ),
      );
}
