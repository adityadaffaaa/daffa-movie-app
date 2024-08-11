import 'dart:io';

import 'package:daffa_movie_app/app/api/dio.dart';
import 'package:daffa_movie_app/app/data/models/response/add_movie_response.dart';
import 'package:daffa_movie_app/app/data/models/response/movie_item_response.dart';
import 'package:daffa_movie_app/app/enums/languages.enum.dart';
import 'package:daffa_movie_app/env/env.dart' as app_env;

/// `MovieDbUserService` adalah kelas yang menyediakan metode untuk
/// mengelola daftar film pengguna seperti menambah atau menghapus film
/// dari daftar favorit dan daftar tonton.
///
/// Kelas ini menggunakan `ApiDio` untuk melakukan permintaan HTTP ke API
/// Movie Database dan memerlukan token akses dan ID akun dari lingkungan
/// aplikasi (`app_env`).
///
/// Contoh penggunaan:
///
/// ```dart
/// final MovieDbUserService userService = MovieDbUserService();
/// await userService.addWatchList(123);
/// ```
class MovieDbUserService {
  /// Instance dari `ApiDio` yang digunakan untuk melakukan permintaan HTTP.
  final ApiDio provider = ApiDio();

  /// Token akses untuk API Movie Database.
  final String _accessToken = app_env.MOVIE_DB_ACCESS_TOKEN_AUTH;

  /// ID akun pengguna yang digunakan untuk mengelola daftar.
  final int _accountId = app_env.ACCOUNT_ID;

  /// Add atau remove film dari daftar tonton pengguna.
  ///
  /// [mediaId] adalah ID film yang ingin ditambahkan atau dihapus dari daftar tonton.
  /// [add] adalah flag untuk menentukan apakah film harus ditambahkan (`true`) atau dihapus (`false`).
  ///
  /// Mengembalikan objek `AddMovieResponse` yang berisi status operasi.
  Future<AddMovieResponse> addWatchList(
    final int mediaId, {
    final bool add = true,
  }) async {
    Map<String, dynamic> data = <String, dynamic>{
      'media_type': 'movie',
      'media_id': mediaId,
      'watchlist': add,
    };

    final dynamic response = await provider.post(
      '/account/$_accountId/watchlist',
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      formData: data,
    );

    return AddMovieResponse.fromJson(response as Map<String, dynamic>);
  }

  /// Add atau remove film dari daftar favorit pengguna.
  ///
  /// [mediaId] adalah ID film yang ingin ditambahkan atau dihapus dari daftar favorit.
  /// [add] adalah flag untuk menentukan apakah film harus ditambahkan (`true`) atau dihapus (`false`).
  ///
  /// Mengembalikan objek `AddMovieResponse` yang berisi status operasi.
  Future<AddMovieResponse> addFavorite(
    final int mediaId, {
    final bool add = true,
  }) async {
    Map<String, dynamic> data = <String, dynamic>{
      'media_type': 'movie',
      'media_id': mediaId,
      'favorite': add,
    };

    final dynamic response = await provider.post(
      '/account/$_accountId/favorite',
      headers: <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      formData: data,
    );

    return AddMovieResponse.fromJson(response as Map<String, dynamic>);
  }

  /// Mendapatkan daftar film favorit pengguna.
  ///
  /// [lang] adalah bahasa yang digunakan (default adalah Bahasa Inggris). Bersifat opsional.
  /// [page] adalah nomor halaman yang ingin diambil (default adalah 1). Bersifat opsional.
  ///
  /// Mengembalikan objek `MovieItemResponse` yang berisi daftar film favorit.
  Future<MovieItemResponse> getFavorite({
    final bool add = true,
    final LanguagesEnum lang = LanguagesEnum.en,
    final int page = 1,
  }) async {
    final dynamic response = await provider.get(
      '/account/$_accountId/favorite/movies?language=${lang.value}&page=$page&sort_by=created_at.asc',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      },
    );

    return MovieItemResponse.fromJson(response as Map<String, dynamic>);
  }

  /// Mendapatkan daftar film dari daftar tonton pengguna.
  ///
  /// [lang] adalah bahasa yang digunakan (default adalah Bahasa Inggris). Bersifat opsional.
  /// [page] adalah nomor halaman yang ingin diambil (default adalah 1). Bersifat opsional.
  ///
  /// Mengembalikan objek `MovieItemResponse` yang berisi daftar film dari daftar tonton.
  Future<MovieItemResponse> getWatchList({
    final bool add = true,
    final LanguagesEnum lang = LanguagesEnum.en,
    final int page = 1,
  }) async {
    final dynamic response = await provider.get(
      '/account/$_accountId/watchlist/movies?language=${lang.value}&page=$page&sort_by=created_at.asc',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      },
    );

    return MovieItemResponse.fromJson(response as Map<String, dynamic>);
  }
}
