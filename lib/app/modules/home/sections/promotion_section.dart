import 'package:carousel_slider/carousel_slider.dart';
import 'package:daffa_movie_app/app/data/models/others/promotion_carousel_item.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/promotion_carousel_controller.dart';
import 'package:daffa_movie_app/app/modules/home/widgets/banner_carousel_indicator.dart';
import 'package:daffa_movie_app/app/modules/home/widgets/banner_item.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget untuk menampilkan section "Promotion" di halaman utama aplikasi.
///
/// [PromotionSection] menampilkan carousel dengan berbagai promosi yang sedang berlangsung.
/// Carousel ini memungkinkan pengguna untuk melihat berbagai penawaran dan promo terbaru.
class PromotionSection extends GetView<PromotionCarouselController> {
  /// Konstruktor untuk membuat instance dari [PromotionSection].
  const PromotionSection({super.key});

  @override
  Widget build(final BuildContext context) =>
      GetBuilder<PromotionCarouselController>(
        init: controller,
        builder: (final PromotionCarouselController ctrl) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: app_const.basePadSize,
          ),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: ctrl.promotionItems
                    .map(
                      (final PromotionCarouselItem item) =>
                          BannerItem(item: item),
                    )
                    .toList(),
                carouselController: ctrl.carouselCtrl,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 10),
                  aspectRatio: 5 / 3,
                  onPageChanged: (final int idx, final _) {
                    ctrl.changePage(idx);
                  },
                ),
              ),
              BannerCarouselIndicator(),
            ],
          ),
        ),
      );
}
