import 'package:flutter/material.dart';

/// Widget [MovieListLayout] adalah kontainer sederhana yang menampilkan
/// konten yang diberikan. Widget ini tidak menambahkan fungsionalitas tambahan
/// pada konten dan hanya berfungsi sebagai pembungkus.
///
/// [content] adalah widget yang akan ditampilkan di dalam [MovieListLayout].
/// Ini memungkinkan Anda untuk menyesuaikan tampilan dengan menggunakan
/// widget lain di dalam [MovieListLayout].
class MovieListLayout extends StatelessWidget {
  /// Widget yang akan ditampilkan di dalam [MovieListLayout].
  final Widget content;

  /// Konstruktor untuk kelas [MovieListLayout].
  ///
  /// [content] adalah widget yang akan ditampilkan di dalam [MovieListLayout].
  const MovieListLayout({
    super.key,
    required this.content,
  });

  @override
  Widget build(final BuildContext context) => content;
}
