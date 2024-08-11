import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;

/// Widget [ActionButton] adalah tombol yang dapat diklik dengan dukungan
/// untuk menampilkan ikon dan teks. Widget ini menggunakan [ElevatedButton]
/// dan memungkinkan penyesuaian warna latar belakang, warna teks, dan ikon.
///
/// [ActionButton] memudahkan pembuatan tombol aksi yang konsisten dengan
/// gaya aplikasi.
class ActionButton extends StatelessWidget {
  /// Fungsi yang akan dipanggil saat tombol ditekan.
  final VoidCallback onPress;

  /// Ikon yang ditampilkan di sebelah kiri teks. Dapat bernilai null jika tidak ada ikon.
  final IconData? icon;

  /// Teks yang ditampilkan di tombol.
  final String title;

  /// Warna latar belakang tombol. Default adalah [app_color.neutral800].
  final Color bgColor;

  /// Warna teks dan ikon tombol. Default adalah [app_color.white].
  final Color color;

  /// Konstruktor untuk kelas [ActionButton].
  /// [onPress] dan [title] wajib diisi, sedangkan [icon], [bgColor], dan [color] bersifat opsional.
  const ActionButton({
    super.key,
    required this.onPress,
    required this.title,
    this.icon,
    this.bgColor = app_color.neutral800,
    this.color = app_color.white,
  });

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            bgColor,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(app_const.baseRadius),
            ),
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: color,
                    size: 16,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 8,
            ),
            AutoSizeText(
              title,
              style: app_typo.paragraph4.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      );
}
