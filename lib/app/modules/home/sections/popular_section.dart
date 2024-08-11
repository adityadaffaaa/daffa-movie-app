import 'package:daffa_movie_app/app/modules/home/controllers/popular_controller.dart';
import 'package:daffa_movie_app/app/widgets/content_layout.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;

/// Widget untuk menampilkan section "Popular" di halaman utama aplikasi.
///
/// [PopularSection] menampilkan daftar film populer dalam bentuk grid dengan opsi
/// untuk menambah/menghapus film dari favorit atau watchlist.
class PopularSection extends GetView<PopularController> {
  /// Konstruktor untuk membuat instance dari [PopularSection].
  const PopularSection({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Padding(
          padding: const EdgeInsets.only(
            top: app_const.baseGapSize,
          ),
          child: ContentLayout(
            title: 'Popular',
            contentPadXNum: 24,
            content: controller.isLoading.value
                ? const CircularProgressIndicator(
                    color: app_color.yellow300,
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 2 / 3.5,
                    ),
                    itemCount: controller.popularMovieItems.take(20).length,
                    itemBuilder: (final BuildContext ctx, final int index) =>
                        MoviePosterCard(
                      item: controller.popularMovieItems[index],
                      onTapFav: () => controller.handleFavorite(
                        controller.popularMovieItems[index].id,
                        isAdd: !controller.popularMovieItems[index].isFavorite,
                      ),
                      onTapWatchList: () => controller.handleWatchList(
                        controller.popularMovieItems[index].id,
                        isAdd: !controller.popularMovieItems[index].isWatchlist,
                      ),
                    ),
                  ),
          ),
        ),
      );
}
