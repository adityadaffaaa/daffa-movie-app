import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:iconly/iconly.dart';

/// [MovieDetailAppBar] adalah AppBar khusus yang digunakan dalam tampilan detail film.
/// Ini mencakup ikon untuk menutup tampilan dan judul untuk bar aplikasi.
///
/// Widget ini mengimplementasikan [PreferredSizeWidget] untuk menyesuaikan ukuran AppBar
/// sesuai dengan kebutuhan desain.
class MovieDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Konstruktor untuk [MovieDetailAppBar].
  const MovieDetailAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size(Get.size.width, Get.size.height / 100 * 6);

  @override
  PreferredSizeWidget build(final BuildContext context) => AppBar(
        backgroundColor: app_color.white,
        leading: InkWell(
          onTap: () {
            Get.close(0);
          },
          child: const Icon(
            IconlyLight.arrow_left_2,
          ),
        ),
        centerTitle: true,
        title: AutoSizeText(
          'Movie Detail',
          style: app_typo.heading3,
        ),
      );
}
