import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/data/models/others/get_size.dart';
import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';
import 'package:daffa_movie_app/app/modules/watchlist/controllers/watchlist_page_controller.dart';
import 'package:daffa_movie_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:get/get.dart';

/// Widget untuk menampilkan avatar pengguna dengan informasi
/// mengenai jumlah film dalam daftar tonton dan film favorit.
class UserAva extends StatelessWidget {
  /// Konstruktor untuk kelas [UserAva].

  UserAva({super.key});

  /// Controller untuk mengelola daftar tonton pengguna.
  final WatchlistPageController watchListCtrl =
      Get.find<WatchlistPageController>();

  /// Controller untuk mengelola film favorit pengguna.
  final FavoritePageController favoritePageCtrl =
      Get.find<FavoritePageController>();

  @override
  Widget build(final BuildContext context) {
    /// Mendapatkan ukuran layout dari konteks build dengan menggunakan fungsi [app_ext.getLayoutSize]
    /// Mengembalikan nilai size bertipe [GetSize]
    final GetSize size = getLayoutSize(context);
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: size.width * 0.15,
          backgroundColor: app_color.yellow200,
          child: Icon(
            Icons.account_circle_rounded,
            size: size.width * 0.15,
            color: app_color.white,
          ),
        ),
        AutoSizeText(
          'Guest User',
          style: app_typo.heading4.copyWith(
            color: app_color.neutral800,
          ),
        ),
        AutoSizeText(
          '@guest',
          style: app_typo.paragraph2.copyWith(
            color: app_color.neutral600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Obx(
                  () => AutoSizeText(
                    watchListCtrl.watchListMovie.length.toString(),
                    style: app_typo.heading4.copyWith(
                      color: app_color.neutral800,
                    ),
                  ),
                ),
                AutoSizeText(
                  'Watchlist',
                  style: app_typo.paragraph2.copyWith(
                    color: app_color.neutral600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: app_const.baseGapSize,
            ),
            Column(
              children: <Widget>[
                Obx(
                  () => AutoSizeText(
                    favoritePageCtrl.favoriteMovies.length.toString(),
                    style: app_typo.heading4.copyWith(
                      color: app_color.neutral800,
                    ),
                  ),
                ),
                AutoSizeText(
                  'Favorite',
                  style: app_typo.paragraph2.copyWith(
                    color: app_color.neutral600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
