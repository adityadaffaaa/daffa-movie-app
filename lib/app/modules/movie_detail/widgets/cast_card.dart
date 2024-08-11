import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// [CastCard] adalah widget yang menampilkan informasi tentang seorang pemeran dalam
/// film. Widget ini mencakup gambar profil pemeran dan nama mereka.
///
/// Widget ini menggunakan [NetworkImage] untuk memuat gambar dari URL dan [AutoSizeText]
/// untuk menampilkan nama pemeran dengan ukuran font yang sesuai.
class CastCard extends StatelessWidget {
  /// Gambar profil pemeran. Gambar ini diambil dari URL yang dihasilkan menggunakan [app_const.movieImgUrlFin].
  final String? image;

  /// Nama pemeran.
  final String name;

  /// Konstruktor untuk [CastCard].
  const CastCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  app_const.baseRadius,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${app_const.movieImgUrlFin}$image',
                  ),
                ),
              ),
            ),
            AutoSizeText(
              name,
              overflow: TextOverflow.ellipsis,
              style: app_typo.paragraph3.copyWith(
                color: app_color.neutral900,
                fontSize: 6,
              ),
            ),
          ],
        ),
      );
}
