import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/extensions.dart' as app_ext;
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

/// Widget [MovieListCard] menampilkan informasi tentang film dalam bentuk kartu.
/// Widget ini menggunakan [GestureDetector] untuk menangani aksi ketika kartu ditekan.
///
/// [MovieListCard] menampilkan gambar film, judul, rating, dan tanggal rilis film.
/// Kartu ini juga dapat menunjukkan ikon favorit atau bookmark tergantung pada
/// status film sebagai favorit.
///
/// [item] adalah objek [MovieResult] yang berisi informasi tentang film.
/// [isFav] menentukan apakah film tersebut ditandai sebagai favorit atau tidak.
/// [onTap] adalah callback yang dipanggil ketika ikon favorit atau bookmark ditekan.
class MovieListCard extends StatelessWidget {
  /// Objek [MovieResult] yang berisi informasi tentang film.
  final MovieResult item;

  /// Menentukan apakah film tersebut ditandai sebagai favorit.
  final bool isFav;

  /// Callback yang dipanggil ketika ikon favorit atau bookmark ditekan.
  final VoidCallback? onTap;

  /// Konstruktor untuk kelas [MovieListCard].
  ///
  /// [item] adalah objek [MovieResult] yang berisi informasi tentang film.
  /// [isFav] menentukan apakah film tersebut ditandai sebagai favorit atau tidak.
  /// [onTap] adalah callback yang dipanggil ketika ikon favorit atau bookmark ditekan.
  const MovieListCard({
    super.key,
    required this.item,
    this.isFav = false,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () {
          Get.toNamed<void>(
            '/movie-detail',
            arguments: item,
          );
        },
        child: Container(
          height: 154,
          margin: const EdgeInsets.symmetric(
            horizontal: app_const.baseGapSize,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              app_const.baseRadius,
            ),
            color: app_color.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 24,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              FutureBuilder<String>(
                future: app_ext.getImageFromLocalStorage(item.id),
                builder: (final _, final AsyncSnapshot<String> snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
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
                                    width: Get.width / 100 * 28,
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
                                  ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(app_const.basePadSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: AutoSizeText(
                              item.originalTitle,
                              overflow: TextOverflow.ellipsis,
                              style: app_typo.paragraph1.copyWith(
                                color: app_color.neutral900,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: onTap,
                            child: isFav
                                ? const Icon(
                                    IconlyBold.heart,
                                    color: app_color.red700,
                                    size: 24,
                                  )
                                : const Icon(
                                    IconlyBold.bookmark,
                                    color: app_color.yellow300,
                                    size: 24,
                                  ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(
                                IconlyBold.star,
                                size: 16,
                                color: app_color.yellow300,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              AutoSizeText(
                                '${item.voteAverage.ceilToDouble()}',
                                style: app_typo.paragraph3.copyWith(
                                  color: app_color.yellow300,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                IconlyLight.calendar,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              AutoSizeText(
                                item.releaseDate != null
                                    ? app_ext
                                        .getDetailsFromDate(item.releaseDate!)
                                        .first
                                    : '',
                                style: app_typo.paragraph4.copyWith(
                                  color: app_color.neutral800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
