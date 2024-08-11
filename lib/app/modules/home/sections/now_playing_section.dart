import 'package:carousel_slider/carousel_slider.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/now_playing_controller.dart';
import 'package:daffa_movie_app/app/modules/home/widgets/now_playing_item.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;

/// Widget untuk menampilkan section "Now Playing" di halaman utama aplikasi.
///
/// [NowPlayingSection] menampilkan daftar film yang sedang tayang saat ini dalam
/// bentuk carousel dengan opsi untuk menambah/menghapus film dari favorit atau
/// watchlist.
class NowPlayingSection extends GetView<NowPlayingController> {
  /// Konstruktor untuk membuat instance dari [NowPlayingSection].
  const NowPlayingSection({super.key});
  @override
  Widget build(final BuildContext context) => Obx(
        () => ContentLayout(
          title: 'Now Playing',
          content: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: app_color.yellow300,
                )
              : CarouselSlider(
                  items: controller.nowPlayingItems
                      .take(6)
                      .map(
                        (final MovieResult item) => NowPlayingItem(
                          item: item,
                          onTapFav: () => controller.handleFavorite(
                            item.id,
                            isAdd: !item.isFavorite,
                          ),
                          onTapWatchList: () => controller.handleWatchList(
                            item.id,
                            isAdd: !item.isWatchlist,
                          ),
                        ),
                      )
                      .toList(),
                  carouselController: controller.carouselCtrl,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 4 / 5,
                    onPageChanged: (final int idx, final _) {
                      controller.changePage(idx);
                    },
                  ),
                ),
        ),
      );
}
