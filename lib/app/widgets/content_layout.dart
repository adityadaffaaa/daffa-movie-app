import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;

/// Widget [ContentLayout] adalah widget tata letak yang menampilkan judul dan
/// konten di bawahnya. Widget ini juga dapat menampilkan tombol "See more"
/// yang dapat diklik untuk melakukan aksi tambahan.
///
/// Widget ini dirancang untuk menampilkan informasi dalam format yang konsisten,
/// dengan opsi untuk menambahkan padding di sekitar konten dan tindakan tambahan
/// melalui tombol "See more".
class ContentLayout extends StatelessWidget {
  /// Judul yang ditampilkan di bagian atas konten.
  final String title;

  /// Konten yang ditampilkan di bawah judul. Dapat berupa widget apa pun atau
  /// bernilai null jika tidak ada konten yang ditampilkan.
  final Widget? content;

  /// Fungsi yang dipanggil saat tombol "See more" diklik. Dapat bernilai null jika
  /// tidak ada tombol "See more" yang diperlukan.
  final VoidCallback? more;

  /// Padding horizontal di sekitar konten. Default adalah 0.0.
  final double contentPadXNum;

  /// Padding vertikal di sekitar konten. Default adalah 0.0.
  final double contentPadYNum;

  /// Konstruktor untuk kelas [ContentLayout].
  /// [title] wajib diisi, sedangkan [content], [more], [contentPadXNum], dan
  /// [contentPadYNum] bersifat opsional.
  const ContentLayout({
    super.key,
    required this.title,
    this.content,
    this.more,
    this.contentPadXNum = 0.0,
    this.contentPadYNum = 0.0,
  });

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: app_const.baseGapSize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  title,
                  style: app_typo.heading4.copyWith(
                    color: app_color.neutral800,
                  ),
                ),
                if (more != null) ...<Widget>[
                  InkWell(
                    onTap: more,
                    child: AutoSizeText(
                      'See more',
                      style: app_typo.paragraph3.copyWith(
                        color: app_color.yellow300,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(
            height: app_const.baseGapSize,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: contentPadXNum,
              vertical: contentPadYNum,
            ),
            child: content ?? const SizedBox(),
          ),
        ],
      );
}
