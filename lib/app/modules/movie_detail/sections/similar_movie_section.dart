import 'package:daffa_movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;

/// [SimilarMovieSection] adalah widget tampilan yang menampilkan daftar film
/// yang mirip dengan film yang sedang dilihat.
///
/// Widget ini mengikat ke [MovieDetailController] menggunakan GetX untuk
/// mengelola state dan menampilkan data yang diperoleh dari controller.
/// Jika data film mirip sedang dimuat, indikator loading akan ditampilkan.
/// Setelah data tersedia, film mirip akan ditampilkan dalam bentuk daftar horizontal.
/// Padding yang berbeda diterapkan pada item pertama dan terakhir di daftar film.

class SimilarMovieSection extends GetView<MovieDetailController> {
  const SimilarMovieSection({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => controller.similarIsLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: app_color.yellow300,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  bottom: app_const.baseGapSize,
                ),
                child: ContentLayout(
                  title: 'Similar Movie',
                  more: () {},
                  content: AspectRatio(
                    aspectRatio: 6 / 4,
                    child: ListView.builder(
                      controller: controller.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.similarMovie.length,
                      itemBuilder: (final _, final int idx) => AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: controller.similarMovie.last ==
                                    controller.similarMovie[idx]
                                ? 24
                                : 12,
                            left: controller.similarMovie.first ==
                                    controller.similarMovie[idx]
                                ? 24
                                : 12,
                          ),
                          child: MoviePosterCard(
                            hideActionButton: true,
                            item: controller.similarMovie[idx],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      );
}
