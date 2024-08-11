import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:iconly/iconly.dart';

/// Widget [NotificationButton] menampilkan sebuah tombol notifikasi dengan
/// ikon lonceng di dalam sebuah lingkaran berwarna.
///
/// [NotificationButton] adalah tombol interaktif yang dapat digunakan untuk
/// menampilkan notifikasi atau memberi akses ke fitur notifikasi dalam aplikasi.
///
/// Konstruktor [NotificationButton] tidak memerlukan parameter tambahan.
///
/// Menggunakan [CircleAvatar] dengan ikon notifikasi dari package [iconly] dan
/// warna latar belakang yang ditentukan oleh [app_color].
class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          right: app_const.baseGapSize,
        ),
        child: InkWell(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: app_color.yellow300,
            child: Icon(
              IconlyLight.notification,
              color: app_color.white,
            ),
          ),
        ),
      );
}
