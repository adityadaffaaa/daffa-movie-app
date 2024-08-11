import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// Widget [MovieListAppBar] adalah implementasi dari [AppBar] yang digunakan
/// untuk menampilkan judul di halaman daftar film. Widget ini menggunakan [AutoSizeText]
/// untuk memastikan teks judul dapat menyesuaikan ukurannya dengan ukuran layar.
///
/// [MovieListAppBar] adalah widget khusus yang mematuhi [PreferredSizeWidget] untuk
/// menentukan ukuran preferensi dari app bar, dengan tinggi tetap 56.
///
/// [title] adalah parameter yang digunakan untuk menentukan teks yang akan ditampilkan
/// sebagai judul pada app bar.
class MovieListAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Teks judul yang akan ditampilkan pada app bar.
  final String title;

  /// Konstruktor untuk kelas [MovieListAppBar].
  ///
  /// [title] adalah teks yang akan ditampilkan sebagai judul pada app bar.
  const MovieListAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size(Get.size.width, 56);

  @override
  PreferredSizeWidget build(final BuildContext context) => AppBar(
        centerTitle: true,
        title: AutoSizeText(
          title,
          style: app_typo.heading4.copyWith(
            color: app_color.neutral950,
          ),
        ),
      );
}
