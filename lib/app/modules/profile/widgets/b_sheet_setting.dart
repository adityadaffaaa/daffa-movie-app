import 'package:auto_size_text/auto_size_text.dart';
import 'package:daffa_movie_app/app/data/models/others/get_size.dart';
import 'package:daffa_movie_app/app/modules/profile/controllers/b_sheet_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:daffa_movie_app/utils/extensions.dart' as app_ext;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;
import 'package:daffa_movie_app/utils/colors.dart' as app_color;
import 'package:daffa_movie_app/utils/typography.dart' as app_typo;
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

/// Widget yang menampilkan bottom sheet dengan pengaturan profil pengguna
/// dan menu navigasi.
class BSheetSetting extends StatelessWidget {
  /// Konstruktor untuk kelas [BSheetSetting].
  BSheetSetting({super.key});

  /// Controller untuk mengelola pengaturan bottom sheet.
  final BSheetSettingController ctrl = Get.find<BSheetSettingController>();

  @override
  Widget build(final BuildContext context) {
    /// Mendapatkan ukuran layout dari konteks build dengan menggunakan fungsi [app_ext.getLayoutSize]
    /// Mengembalikan nilai size bertipe [GetSize]
    final GetSize size = app_ext.getLayoutSize(context);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(
          app_const.basePadSize,
        ),
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: app_color.neutral950,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.close(0);
                },
                child: const Icon(
                  IconlyLight.arrow_down_circle,
                  color: app_color.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(
              height: app_const.baseGapSize,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              leading: const CircleAvatar(
                radius: 28,
                backgroundColor: app_color.yellow200,
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 28,
                  color: app_color.white,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    'Guest User',
                    style: app_typo.paragraph1.copyWith(color: app_color.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AutoSizeText(
                    '@guest',
                    style: app_typo.paragraph4.copyWith(color: app_color.white),
                  ),
                ],
              ),
              trailing: const Icon(
                IconlyLight.arrow_right_2,
                color: app_color.white,
              ),
            ),
            ListView.builder(
              itemCount: ctrl.menus.length,
              shrinkWrap: true,
              itemBuilder: (final _, final int idx) => InkWell(
                onTap: () {
                  if (ctrl.menus[idx].title == 'Watchlist Movie') {
                    Get.close(0);
                    ctrl.mainScreenController.setCurrentIdx(2);
                  }
                  if (ctrl.menus[idx].title == 'Favorite Movie') {
                    Get.close(0);
                    ctrl.mainScreenController.setCurrentIdx(1);
                  }
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  leading: Text(
                    ctrl.menus[idx].title,
                    style: app_typo.paragraph2.copyWith(
                      color: app_color.white.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    ctrl.menus[idx].icon,
                    color: app_color.white.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
