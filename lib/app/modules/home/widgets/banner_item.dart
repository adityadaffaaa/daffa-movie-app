import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/data/models/others/promotion_carousel_item.dart';

import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;

/// Widget untuk menampilkan item banner di carousel promosi.
///
/// [BannerItem] menampilkan gambar dengan teks overlay untuk promosi.
/// Gambar yang ditampilkan menggunakan `AssetImage`, dan teks overlay
/// ditata dengan gaya dan warna yang ditentukan.
///
/// Widget ini digunakan dalam carousel untuk menampilkan berbagai promosi
/// yang diatur dalam `PromotionCarouselItem`
class BannerItem extends StatelessWidget {
  /// Konstruktor untuk membuat instance dari [BannerItem].
  ///
  /// [item] adalah objek [PromotionCarouselItem] yang berisi data untuk
  /// banner ini, termasuk gambar, judul, dan deskripsi.
  final PromotionCarouselItem item;

  /// Konstruktor [BannerItem] dengan parameter [item] yang diperlukan.
  const BannerItem({super.key, required this.item});

  @override
  Widget build(final BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(app_const.baseRadius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              item.image,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(
            app_const.basePadSize,
          ),
          color: const Color.fromRGBO(
            0,
            0,
            0,
            0.4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AutoSizeText(
                item.title,
                style: app_typo.heading4.copyWith(
                  color: app_color.white,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              AutoSizeText(
                item.desc,
                style: app_typo.paragraph4.copyWith(
                  color: app_color.white,
                ),
              ),
            ],
          ),
        ),
      );
}
