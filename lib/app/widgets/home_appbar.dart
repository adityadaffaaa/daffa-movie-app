import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// Widget [HomeAppBar] adalah implementasi dari [AppBar] yang digunakan
/// sebagai bagian dari antarmuka pengguna di halaman utama aplikasi. Widget ini
/// menampilkan pesan sapaan dan tombol notifikasi.
///
/// [HomeAppBar] adalah widget khusus yang mematuhi [PreferredSizeWidget] untuk
/// menentukan ukuran preferensi dari app bar, dengan tinggi tetap 56.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Konstruktor untuk kelas [HomeAppBar].
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size(Get.size.width, 56);

  @override
  PreferredSizeWidget build(final BuildContext context) => AppBar(
        title: RichText(
          text: TextSpan(
            style: app_typo.paragraph2.copyWith(
              color: app_color.neutral800,
            ),
            children: <InlineSpan>[
              const TextSpan(
                text: 'Hello,',
              ),
              TextSpan(
                text: ' Guest',
                style: app_typo.paragraph1,
              ),
            ],
          ),
        ),
        actions: const <Widget>[
          NotificationButton(),
        ],
      );
}
