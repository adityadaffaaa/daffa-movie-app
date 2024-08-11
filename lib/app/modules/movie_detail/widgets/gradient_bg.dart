import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [GradientBg] adalah widget yang menampilkan latar belakang dengan gradien linear.
/// Widget ini memungkinkan pembuatan efek gradien di dalam aplikasi dengan
/// posisi dan warna gradien yang dapat dikonfigurasi.
///
/// Widget ini menggunakan [LinearGradient] untuk membuat gradien dan [Positioned]
/// untuk menempatkannya di posisi yang ditentukan dalam widget parent.
class GradientBg extends StatelessWidget {
  /// Persentase tinggi dari gradien berdasarkan tinggi layar. Nilai default adalah 20.
  final double heightPercent;

  /// Warna di bagian awal gradien.
  final Color beginColor;

  /// Warna di bagian akhir gradien.
  final Color endColor;

  /// Posisi awal gradien.
  final AlignmentGeometry beginPosition;

  /// Posisi akhir gradien.
  final AlignmentGeometry endPosition;

  /// Posisi atas dari gradien dalam [Positioned]. Jika tidak ditentukan, gradien tidak
  /// akan diposisikan di bagian atas.
  final double? top;

  /// Posisi bawah dari gradien dalam [Positioned]. Jika tidak ditentukan, gradien tidak
  /// akan diposisikan di bagian bawah.
  final double? bottom;

  /// Konstruktor untuk [GradientBg].
  const GradientBg({
    super.key,
    required this.beginColor,
    required this.endColor,
    required this.endPosition,
    required this.beginPosition,
    this.heightPercent = 20,
    this.bottom,
    this.top,
  });

  @override
  Widget build(final BuildContext context) => Positioned(
        top: top,
        bottom: bottom,
        height: Get.height / 100 * heightPercent,
        width: Get.width,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: beginPosition,
              end: endPosition,
              colors: <Color>[
                beginColor,
                endColor,
              ],
            ),
          ),
        ),
      );
}
