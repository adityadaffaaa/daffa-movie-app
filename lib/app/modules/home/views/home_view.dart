import 'package:daffa_movie_app/app/modules/home/sections/now_playing_section.dart';
import 'package:daffa_movie_app/app/modules/home/sections/popular_section.dart';
import 'package:daffa_movie_app/app/modules/home/sections/promotion_section.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

/// Widget untuk menampilkan tampilan beranda aplikasi.
///
/// [HomeView] adalah widget utama yang menggabungkan berbagai section
/// di halaman utama aplikasi, termasuk promosi, film yang sedang tayang,
/// dan film populer.
class HomeView extends GetView<dynamic> {
  /// Konstruktor untuk membuat instance dari [HomeView].
  const HomeView({super.key});
  @override
  Widget build(final BuildContext context) => ListView(
        children: const <Widget>[
          PromotionSection(),
          NowPlayingSection(),
          PopularSection(),
        ],
      );
}
