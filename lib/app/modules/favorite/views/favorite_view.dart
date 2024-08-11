import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/modules/favorite/controllers/favorite_page_controller.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;

/// [FavoriteView] adalah widget tampilan yang menampilkan daftar film favorit pengguna.
///
/// Widget ini mengikat ke [FavoritePageController] menggunakan GetX untuk mengelola
/// state dan menampilkan data yang diperoleh dari controller. Jika daftar film favorit
/// kosong, tampilan akan menampilkan pesan bahwa daftar favorit kosong.
class FavoriteView extends GetView<FavoritePageController> {
  const FavoriteView({super.key});

  /// Membangun tampilan favorit berdasarkan state yang disediakan oleh [FavoritePageController].
  ///
  /// Jika data sedang dimuat ([isLoading] bernilai true), maka akan menampilkan indikator loading.
  /// Jika daftar film favorit kosong, akan menampilkan pesan "Favorite is Empty!".
  /// Jika ada film favorit, maka film tersebut akan ditampilkan dalam bentuk daftar.
  @override
  Widget build(final BuildContext context) => Obx(
        () => MovieListLayout(
          content: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.favoriteMovies.isEmpty
                  ? Center(
                      child: AutoSizeText(
                        'Favorite is Empty !',
                        style: app_typo.paragraph4,
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (final _, final int idx) =>
                          const SizedBox(
                        height: 14,
                      ),
                      itemCount: controller.favoriteMovies.length,
                      itemBuilder: (final _, final int idx) => MovieListCard(
                        item: controller.favoriteMovies[idx],
                        isFav: true,
                        onTap: () => controller.handleAddToFavorite(
                          controller.favoriteMovies[idx].id,
                          isAdd: false,
                        ),
                      ),
                    ),
        ),
      );
}
