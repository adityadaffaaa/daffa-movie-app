import 'dart:io';

import 'package:daffa_movie_app/app/api/dio.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_credit_response.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_genre_response.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/enums/languages.enum.dart';
import 'package:daffa_movie_app/app/enums/movie_type.enum.dart';
import 'package:daffa_movie_app/env/env.dart' as app_env;

/// `MovieDbService` adalah kelas yang menyediakan berbagai metode untuk
/// berinteraksi dengan API Movie Database.
///
/// Kelas ini menggunakan `ApiDio` untuk melakukan permintaan HTTP ke API
/// Movie Database dan menyediakan metode untuk mendapatkan informasi film,
/// genre film, kredit film, dan film serupa.
///
/// Contoh penggunaan:
///
/// ```dart
/// final MovieDbService movieService = MovieDbService();
/// MovieItemResponse movies = await movieService.getMovie(MovieTypeEnum.popular);
/// ```
class MovieDbService {
  /// Instance dari `ApiDio` yang digunakan untuk melakukan permintaan HTTP.
  final ApiDio provider = ApiDio();

  /// Token akses untuk API Movie Database.
  final String _accessToken = app_env.MOVIE_DB_ACCESS_TOKEN_AUTH;

  /// Mendapatkan daftar film berdasarkan tipe film, bahasa, dan halaman.
  ///
  /// [movieType] adalah tipe film yang ingin diambil (misalnya, popular, top_rated, dll.).
  /// [lang] adalah bahasa yang digunakan (default adalah Bahasa Inggris). Bersifat opsional.
  /// [page] adalah nomor halaman yang ingin diambil (default adalah 1). Bersifat opsional.
  ///
  /// Mengembalikan objek `MovieItemResponse` yang berisi data film.
  Future<MovieItemResponse> getMovie(
    final MovieTypeEnum movieType, {
    final LanguagesEnum lang = LanguagesEnum.en,
    final int page = 1,
  }) async {
    final dynamic response = await provider.get(
      '/movie/${movieType.value}?language=${lang.value}&page=$page',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      },
    );

    return MovieItemResponse.fromJson(response as Map<String, dynamic>);
  }

  /// Mendapatkan daftar genre film berdasarkan bahasa.
  ///
  /// [lang] adalah bahasa yang digunakan (default adalah Bahasa Inggris). Bersifat opsional.
  ///
  /// Mengembalikan objek `MovieGenreResponse` yang berisi data genre film.
  Future<MovieGenreResponse> getGenre({
    final LanguagesEnum lang = LanguagesEnum.en,
  }) async {
    final dynamic response = await provider.get(
      '/genre/movie/list?language=${lang.value}',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      },
    );

    return MovieGenreResponse.fromJson(response as Map<String, dynamic>);
  }

  /// Mendapatkan informasi kredit (cast dan crew) untuk film berdasarkan ID film.
  ///
  /// [movieId] adalah ID film yang ingin diambil informasinya.
  /// [lang] adalah bahasa yang digunakan (default adalah Bahasa Inggris). Bersifat opsional.
  ///
  /// Mengembalikan objek `MovieCreditResponse` yang berisi informasi kredit film.
  Future<MovieCreditResponse> getCredit(
    final int movieId, {
    final LanguagesEnum lang = LanguagesEnum.en,
  }) async {
    final dynamic response = await provider.get(
      '/movie/$movieId/credits?language=${lang.value}',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      },
    );

    return MovieCreditResponse.fromJson(response as Map<String, dynamic>);
  }

  /// Mendapatkan daftar film yang mirip dengan film berdasarkan ID film.
  ///
  /// [movieId] adalah ID film yang ingin dicari film-film serupa.
  /// [lang] adalah bahasa yang digunakan (default adalah Bahasa Inggris). Bersifat opsional.
  /// [page] adalah nomor halaman yang ingin diambil (default adalah 1). Bersifat opsional.
  ///
  /// Mengembalikan objek `MovieItemResponse` yang berisi daftar film serupa.
  Future<MovieItemResponse> getSimilar(
    final int movieId, {
    final LanguagesEnum lang = LanguagesEnum.en,
    final int page = 1,
  }) async {
    final dynamic response = await provider.get(
      '/movie/$movieId/similar?language=${lang.value}&page=$page',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      },
    );

    return MovieItemResponse.fromJson(response as Map<String, dynamic>);
  }
}
