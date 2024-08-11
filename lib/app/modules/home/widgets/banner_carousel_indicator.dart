import 'package:daffa_movie_app/app/data/models/others/promotion_carousel_item.dart';
import 'package:daffa_movie_app/app/modules/home/controllers/promotion_carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;

/// Widget indikator untuk carousel promosi.
///
/// [BannerCarouselIndicator] menampilkan indikator berbentuk lingkaran di
/// bawah carousel promosi yang menunjukkan halaman mana yang sedang aktif.
///
/// Indikator ini menggunakan warna yang berbeda untuk halaman aktif dan
/// halaman tidak aktif. Pengguna dapat mengetuk indikator untuk berpindah
/// ke halaman carousel yang sesuai.
class BannerCarouselIndicator extends StatelessWidget {
  /// Konstruktor untuk membuat instance dari [BannerCarouselIndicator].
  BannerCarouselIndicator({
    super.key,
  });

  /// Controller untuk mengelola carousel promosi.
  final PromotionCarouselController ctrl =
      Get.find<PromotionCarouselController>();

  @override
  Widget build(final BuildContext context) => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ctrl.promotionItems
              .asMap()
              .entries
              .map(
                (final MapEntry<int, PromotionCarouselItem> entry) =>
                    GestureDetector(
                  onTap: () => ctrl.carouselCtrl.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ctrl.carouselIdx.value == entry.key
                          ? app_color.yellow300
                          : app_color.neutral200,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
}
