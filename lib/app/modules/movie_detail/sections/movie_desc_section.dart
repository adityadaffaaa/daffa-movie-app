import 'package:auto_size_text/auto_size_text.dart';

import 'package:daffa_movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/widgets/cast_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// [MovieDescSection] adalah widget tampilan yang menampilkan deskripsi film
/// dan daftar aktor dari film.
///
/// Widget ini mengikat ke [MovieDetailController] menggunakan GetX untuk
/// mengelola state dan menampilkan data yang diperoleh dari controller.
/// Jika data kredit film sedang dimuat ([castIsLoading] bernilai true),
/// maka akan menampilkan indikator loading. Jika data sudah tersedia,
/// tampilan akan menampilkan deskripsi film dan daftar aktor.
class MovieDescSection extends GetView<MovieDetailController> {
  const MovieDescSection({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => controller.castIsLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: app_color.yellow300,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: app_const.baseGapSize,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      'About Movie',
                      style: app_typo.heading4.copyWith(
                        color: app_color.neutral800,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AutoSizeText(
                      controller.getMovieDetail.overview,
                      maxLines: controller.expandAbout.value ? 20 : 5,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: app_typo.paragraph2.copyWith(
                        color: app_color.neutral800,
                      ),
                    ),
                    InkWell(
                      onTap: controller.handleExpand,
                      child: AutoSizeText(
                        controller.expandAbout.value ? 'close' : 'more...',
                        style: app_typo.paragraph2.copyWith(
                          color: app_color.yellow600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AutoSizeText(
                      'Cast',
                      style: app_typo.heading4.copyWith(
                        color: app_color.neutral800,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 4,
                      child: ListView.separated(
                        separatorBuilder: (final _, final int index) =>
                            const SizedBox(
                          width: app_const.basePadSize,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.getCast.take(10).length,
                        itemBuilder: (final _, final int idx) => CastCard(
                          image: controller.getCast[idx].profilePath,
                          name: controller.getCast[idx].name,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
      );
}
