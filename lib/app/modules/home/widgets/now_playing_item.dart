import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/now_playing_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/extensions.dart' as app_ext;

/// Widget untuk menampilkan item "Now Playing" dengan gambar, judul, dan tombol aksi.
///
/// [NowPlayingItem] menampilkan gambar film, judul, dan tombol aksi untuk menandai film
/// sebagai favorit atau menambahkannya ke daftar tontonan. Ini juga menyediakan
/// navigasi ke halaman detail film saat gambar diklik.
class NowPlayingItem extends StatelessWidget {
  /// Objek [MovieResult] yang berisi informasi tentang film.
  final MovieResult item;

  /// Callback untuk menangani aksi favorit.
  final VoidCallback onTapFav;

  /// Callback untuk menangani aksi daftar tontonan.
  final VoidCallback onTapWatchList;

  /// Konstruktor untuk membuat instance [NowPlayingItem].
  NowPlayingItem({
    super.key,
    required this.item,
    required this.onTapFav,
    required this.onTapWatchList,
  });

  /// Mengambil instance [NowPlayingController]
  final NowPlayingController ctrl = Get.find<NowPlayingController>();

  @override
  Widget build(final BuildContext context) => Obx(
        () => Column(
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
            if (ctrl.nowPlayingItems.indexOf(item) ==
                ctrl.carouselIdx.value) ...<Widget>[
              const SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: onTapFav,
                      child: Icon(
                        item.isFavorite ? IconlyBold.heart : IconlyLight.heart,
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
                      onPress: onTapWatchList,
                      title: 'Watchlist',
                      icon: IconlyLight.bookmark,
                      bgColor: item.isWatchlist
                          ? app_color.yellow300
                          : app_color.neutral800,
                      color: item.isWatchlist
                          ? app_color.neutral800
                          : app_color.white,
                    ),
                  ),
                ],
              ),
              AutoSizeText(
                item.title,
                overflow: TextOverflow.ellipsis,
                style: app_typo.paragraph1.copyWith(
                  color: app_color.neutral800,
                ),
              ),
            ],
          ],
        ),
      );
}
