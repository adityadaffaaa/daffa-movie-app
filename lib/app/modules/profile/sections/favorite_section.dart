import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/modules/profile/controllers/favorite_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;

/// [FavoriteSection] menampilkan daftar film favorit pengguna pada halaman profil.
/// Jika daftar film favorit kosong, menampilkan pesan yang menyatakan bahwa favorit kosong.
/// Jika ada film favorit, menampilkan daftar horizontal dari poster film favorit.
class FavoriteSection extends GetView<FavoriteController> {
  const FavoriteSection({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: app_const.baseGapSize,
        ),
        child: ContentLayout(
          title: 'Favorite Movie',
          more: () {
            controller.mainScreenController.setCurrentIdx(1);
          },
          content: controller.favoritePageController.favoriteMovies.isEmpty
              ? Center(
                  child: AutoSizeText(
                    'Favorite is Empty !',
                    style: app_typo.paragraph4,
                  ),
                )
              : AspectRatio(
                  aspectRatio: 6 / 4,
                  child: ListView.builder(
                    controller: controller.scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        controller.favoritePageController.favoriteMovies.length,
                    itemBuilder: (final _, final int idx) => AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: controller.favoritePageController
                                      .favoriteMovies.last ==
                                  controller.favoritePageController
                                      .favoriteMovies[idx]
                              ? 24
                              : 12,
                          left: controller.favoritePageController.favoriteMovies
                                      .first ==
                                  controller.favoritePageController
                                      .favoriteMovies[idx]
                              ? 24
                              : 12,
                        ),
                        child: MoviePosterCard(
                          hideActionButton: true,
                          item: controller
                              .favoritePageController.favoriteMovies[idx],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      );
}
