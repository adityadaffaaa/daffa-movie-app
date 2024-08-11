import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;

/// [MovieLabel] adalah widget untuk menampilkan label dengan latar belakang berwarna
/// dan teks yang dapat disesuaikan. Widget ini berguna untuk menunjukkan informasi
/// seperti genre, rating, atau label lain dalam aplikasi.
///
/// Widget ini memungkinkan penyesuaian warna latar belakang, gaya teks, dan radius sudut
/// dari label.
class MovieLabel extends StatelessWidget {
  /// Warna latar belakang dari label.
  final Color bgColor;

  /// Teks yang akan ditampilkan di dalam label.
  final String title;

  /// Persentase radius dari sudut label.
  final double radiusPercent;

  /// Gaya teks yang digunakan untuk label.
  final TextStyle? titleStyle;

  /// Penempatan teks di dalam label.
  final AlignmentGeometry? alignment;

  /// Konstruktor untuk [MovieLabel].
  /// [title] adalah teks yang ditampilkan dalam label.
  /// [bgColor] adalah warna latar belakang, dengan nilai default `app_color.yellow300`.
  /// [radiusPercent] mengatur radius sudut label dalam persen, dengan nilai default 100
  /// yang berarti sudut bulat penuh.
  /// [titleStyle] adalah gaya teks yang digunakan, dengan nilai default `null`.
  /// [alignment] menentukan penempatan teks di dalam label, dengan nilai default `null`.
  const MovieLabel({
    super.key,
    required this.title,
    this.bgColor = app_color.yellow300,
    this.radiusPercent = 100,
    this.titleStyle,
    this.alignment,
  });

  @override
  Widget build(final BuildContext context) => Container(
        alignment: alignment,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radiusPercent / 100 * 100),
        ),
        child: Text(
          title,
          style: titleStyle,
        ),
      );
}
