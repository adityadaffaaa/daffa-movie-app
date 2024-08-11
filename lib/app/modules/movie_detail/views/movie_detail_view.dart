import 'package:daffa_movie_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/sections/movie_desc_section.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/sections/movie_head_poster_section.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/sections/similar_movie_section.dart';
import 'package:daffa_movie_app/app/modules/movie_detail/widgets/movie_detail_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [MovieDetailView] adalah widget tampilan yang menampilkan detail dari film yang dipilih.
///
/// Widget ini mengikat ke [MovieDetailController] menggunakan GetX untuk mengelola
/// state dan menampilkan data yang diperoleh dari controller. Tampilan ini
/// terdiri dari beberapa bagian, termasuk poster film, deskripsi film, dan daftar
/// film yang mirip. AppBar khusus untuk detail film juga ditampilkan di bagian atas
/// layar.
class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: const MovieDetailAppBar(),
        body: ListView(
          children: const <Widget>[
            MovieHeadPosterSection(),
            MovieDescSection(),
            SimilarMovieSection(),
          ],
        ),
      );
}
