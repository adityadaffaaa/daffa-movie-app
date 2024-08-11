import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/extensions.dart' as app_ext;
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

/// Widget [MoviePosterCard] menampilkan kartu film dengan poster dan beberapa
/// elemen UI terkait, seperti tombol favorit dan tombol watchlist.
///
/// [item] adalah model data film yang akan ditampilkan pada kartu.
/// [isNowPlaying] menentukan apakah film sedang diputar sekarang (default: false).
/// [hideTitle] menentukan apakah judul film akan disembunyikan (default: false).
/// [hideActionButton] menentukan apakah tombol aksi akan disembunyikan (default: false).
/// [isHorizontal] menentukan orientasi gambar poster (default: false).
/// [onTapFav] adalah callback yang dipanggil ketika tombol favorit ditekan.
/// [onTapWatchList] adalah callback yang dipanggil ketika tombol watchlist ditekan.
class MoviePosterCard extends StatelessWidget {
  final MovieResult item;
  final bool isNowPlaying, hideTitle, hideActionButton, isHorizontal;
  final VoidCallback? onTapFav, onTapWatchList;

  /// Konstruktor untuk kelas [MoviePosterCard].
  ///
  /// [item] adalah model data film yang akan ditampilkan pada kartu.
  /// [isNowPlaying], [hideTitle], [hideActionButton], [isHorizontal], [onTapFav], dan [onTapWatchList]
  /// adalah parameter opsional untuk menyesuaikan tampilan dan interaksi kartu film.
  const MoviePosterCard({
    super.key,
    required this.item,
    this.hideTitle = false,
    this.isNowPlaying = false,
    this.hideActionButton = false,
    this.isHorizontal = false,
    this.onTapFav,
    this.onTapWatchList,
  });

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed<void>(
                  '/movie-detail',
                  arguments: item,
                );
              },
              child: FutureBuilder<String>(
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
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        app_const.baseRadius,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: isHorizontal
                                            ? Alignment.topCenter
                                            : Alignment.center,
                                        image: FileImage(
                                          File(
                                            snapshot.data!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          !hideActionButton
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: onTapFav,
                        child: Icon(
                          item.isFavorite
                              ? IconlyBold.heart
                              : IconlyLight.heart,
                          color: app_color.red700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 4,
                      child: ActionButton(
                        onPress: onTapWatchList ?? () {},
                        title: 'Watchlist',
                        bgColor: item.isWatchlist
                            ? app_color.yellow300
                            : app_color.neutral800,
                        color: item.isWatchlist
                            ? app_color.neutral800
                            : app_color.white,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          !hideTitle
              ? AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  item.title,
                  style: app_typo.paragraph1.copyWith(
                    color: app_color.neutral800,
                  ),
                )
              : const SizedBox(),
        ],
      );
}
