import 'package:daffa_movie_app/app/modules/profile/widgets/b_sheet_setting.dart';
import 'package:daffa_movie_app/app/modules/profile/widgets/user_ava.dart';
import 'package:daffa_movie_app/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

/// [HeadSection] adalah widget yang menampilkan bagian atas halaman profile.

class HeadSection extends GetView<dynamic> {
  /// Konstruktor untuk [HeadSection].
  const HeadSection({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Expanded(
              child: NotificationButton(),
            ),
            Expanded(flex: 2, child: UserAva()),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.bottomSheet<void>(
                    BSheetSetting(),
                    isScrollControlled: true,
                    ignoreSafeArea: false,
                  );
                },
                child: const Icon(
                  IconlyLight.setting,
                ),
              ),
            ),
          ],
        ),
      );
}
