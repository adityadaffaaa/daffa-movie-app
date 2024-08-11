import 'package:daffa_movie_app/app/modules/profile/sections/favorite_section.dart';
import 'package:daffa_movie_app/app/modules/profile/sections/head_section.dart';
import 'package:daffa_movie_app/app/modules/profile/sections/watchlist_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [ProfileView] adalah widget yang menampilkan tampilan profil.
/// Widget ini menggunakan [ListView] untuk menampilkan beberapa bagian dari profil pengguna secara vertikal.
///
/// Bagian-bagian yang ditampilkan meliputi:
/// - [HeadSection]: Menampilkan bagian atas profil yang mencakup notifikasi, avatar pengguna, dan pengaturan.
/// - [WatchlistSection]: Menampilkan daftar film yang ada di watchlist .
/// - [FavoriteSection]: Menampilkan daftar film favorit .
class ProfileView extends GetView<dynamic> {
  const ProfileView({super.key});

  @override
  Widget build(final BuildContext context) => ListView(
        children: const <Widget>[
          HeadSection(),
          WatchlistSection(),
          FavoriteSection(),
        ],
      );
}
