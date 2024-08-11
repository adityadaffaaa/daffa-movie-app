import 'dart:io';

import 'package:daffa_movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/widgets/gradient_bg.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/widgets/main_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/extensions.dart' as app_ext;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// [MovieHeadPosterSection] adalah widget tampilan yang menampilkan poster film
/// dengan latar belakang gradien dan informasi utama film.
///
/// Widget ini mengikat ke [MovieDetailController] menggunakan GetX untuk
/// mengelola state dan menampilkan data yang diperoleh dari controller.
/// Poster film diambil dari penyimpanan lokal dan ditampilkan dengan latar belakang
/// gradien di atas dan bawah. Widget ini juga menampilkan informasi utama film
/// seperti judul, genre, tahun rilis, dan rata-rata vote.
class MovieHeadPosterSection extends GetView<MovieDetailController> {
  const MovieHeadPosterSection({super.key});

  @override
  Widget build(final BuildContext context) => AspectRatio(
        aspectRatio: 3 / 4,
        child: FutureBuilder<String>(
          future:
              app_ext.getImageFromLocalStorage(controller.getMovieDetail.id),
          builder: (final _, final AsyncSnapshot<String> snapshot) => snapshot
                      .connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(
                    color: app_color.yellow300,
                  ),
                )
              : snapshot.hasError
                  ? Center(
                      child: Text(
                        'Image is error!',
                        style: app_typo.paragraph4,
                      ),
                    )
                  : !snapshot.hasData || snapshot.data == ''
                      ? Center(
                          child: Text(
                            'Image is Empty!',
                            style: app_typo.paragraph4,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(
                                  snapshot.data!,
                                ),
                              ),
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              GradientBg(
                                beginColor: Colors.black,
                                endColor: Colors.black.withOpacity(0),
                                beginPosition: Alignment.topCenter,
                                endPosition: Alignment.bottomCenter,
                                heightPercent: 30,
                                top: 0,
                              ),
                              GradientBg(
                                beginColor: app_color.white.withOpacity(0),
                                endColor: app_color.white,
                                beginPosition: Alignment.topCenter,
                                endPosition: Alignment.bottomCenter,
                                bottom: 0,
                              ),
                              Positioned(
                                bottom: 32,
                                right: Get.width / 100 * 10,
                                left: Get.width / 100 * 10,
                                child: Obx(
                                  () => MainInformation(
                                    title:
                                        controller.getMovieDetail.originalTitle,
                                    genre: controller
                                            .movieDetailGenre!.isNotEmpty
                                        ? controller.movieDetailGenre![0].name
                                        : null,
                                    year:
                                        controller.getMovieDetail.releaseDate !=
                                                null
                                            ? app_ext
                                                .getDetailsFromDate(
                                                  controller.getMovieDetail
                                                      .releaseDate!,
                                                )
                                                .first
                                            : '',
                                    vote: controller.getMovieDetail.voteAverage
                                        .ceilToDouble()
                                        .toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
        ),
      );
}
