import 'package:daffa_movie_app/app/modules/movie_detail/widgets/movie_label.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// [MainInformation] adalah widget yang menampilkan informasi utama tentang film.
/// Widget ini termasuk judul film, tahun rilis, genre, dan rating film.
/// Informasi ini ditampilkan dengan menggunakan [MovieLabel] untuk format yang konsisten.
///
/// Widget ini mengatur tata letak elemen dalam kolom dan baris untuk menampilkan informasi
/// dengan gaya yang sesuai.
class MainInformation extends StatelessWidget {
  /// Judul film.
  final String title;

  /// Tahun rilis film.
  final String year;

  /// Genre film (opsional).
  final String? genre;

  /// Vote film.
  final String vote;

  /// Konstruktor untuk [MainInformation].
  const MainInformation({
    super.key,
    required this.title,
    required this.year,
    required this.vote,
    this.genre,
  });

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          MovieLabel(
            title: title,
            titleStyle: app_typo.paragraph1.copyWith(
              color: app_color.neutral950,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MovieLabel(
                  radiusPercent: 10,
                  alignment: Alignment.center,
                  title: vote,
                  bgColor: app_color.yellow700,
                  titleStyle: app_typo.paragraph4.copyWith(
                    color: app_color.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: MovieLabel(
                  radiusPercent: 10,
                  alignment: Alignment.center,
                  title: genre ?? '',
                  bgColor: app_color.yellow700,
                  titleStyle: app_typo.paragraph4.copyWith(
                    color: app_color.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: MovieLabel(
                  radiusPercent: 10,
                  alignment: Alignment.center,
                  title: year,
                  bgColor: app_color.yellow700,
                  titleStyle: app_typo.paragraph4.copyWith(
                    color: app_color.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
