import 'package:dio/dio.dart';
import 'package:daffa_movie_app/app/api/exceptions.dart';
import 'package:daffa_movie_app/env/env.dart' as app_env;
import 'package:daffa_movie_app/utils/extensions.dart' as app_ext;
import 'package:logger/logger.dart';

/// `ApiDio` adalah kelas yang menyediakan metode untuk melakukan
/// permintaan HTTP GET dan POST menggunakan paket `Dio`.
///
/// Kelas ini juga menangani pengecekan koneksi internet dan
/// mencatat log permintaan serta respons HTTP.
///
/// Contoh penggunaan:
///
/// ```dart
/// final apiDio = ApiDio();
/// final response = await apiDio.get('/movies');
/// ```
class ApiDio {
  /// Instance dari `Dio` yang digunakan untuk mengirimkan permintaan HTTP.
  Dio dio = Dio();

  /// Base URL untuk API Movie DB, diambil dari file env (environment).
  final String _baseUrl = app_env.MOVIE_DB_BASE_URL;

  /// Versi dari API Movie DB, diambil dari file env (environment).
  final String _version = app_env.MOVIE_DB_VERSION;

  /// Logger digunakan untuk mencatat log debug dan informasi.
  final Logger logger = Logger();

  /// Mengirimkan permintaan HTTP GET ke URL yang diberikan.
  ///
  /// [url] adalah path relatif dari endpoint API.
  /// [headers] adalah opsi tambahan untuk header yang akan dikirimkan.
  ///
  /// Mengembalikan data respons sebagai objek dinamis.
  ///
  /// Jika tidak ada koneksi internet, akan melempar `NetworkException`.
  /// Jika terjadi kesalahan lain saat permintaan, akan melempar `OtherException`.
  ///
  /// Contoh penggunaan:
  ///
  /// ```dart
  /// final response = await apiDio.get('/movies');
  /// ```
  Future<dynamic> get(
    final String url, {
    final Map<String, String>? headers,
  }) async {
    dynamic responseJson;

    if (await app_ext.hasConnection()) {
      logger.d('$_baseUrl$_version$url');
      try {
        final Response<dynamic> response = await dio.get(
          '$_baseUrl$_version$url',
          options: Options(
            headers: headers,
            validateStatus: (final int? value) => true,
          ),
        );

        logger.i('response ${response.data}');

        responseJson = response.data;
      } catch (e) {
        throw OtherException(e);
      }
    } else {
      throw NetworkException();
    }

    return responseJson;
  }

  /// Mengirimkan permintaan HTTP POST ke URL yang diberikan.
  ///
  /// [url] adalah path relatif dari endpoint API.
  /// [formData] adalah data yang akan dikirimkan dalam body permintaan.
  /// [headers] adalah opsi tambahan untuk header yang akan dikirimkan.
  ///
  /// Mengembalikan data respons sebagai objek dinamis.
  ///
  /// Jika tidak ada koneksi internet, akan melempar `NetworkException`.
  /// Jika terjadi kesalahan lain saat permintaan, akan melempar `OtherException`.
  ///
  /// Contoh penggunaan:
  ///
  /// ```dart
  /// final response = await apiDio.post('/movies', formData: {'title': 'Inception'});
  /// ```
  Future<dynamic> post(
    final String url, {
    final Map<String, dynamic>? formData,
    final Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;

    if (await app_ext.hasConnection()) {
      logger.d('$_baseUrl$_version$url');
      try {
        final Response<dynamic> response = await dio.post(
          '$_baseUrl$_version$url',
          data: formData,
          options: Options(
            headers: headers,
            validateStatus: (final int? value) => true,
          ),
        );

        logger.i('formDataFields $formData');

        responseJson = response.data;
      } catch (e) {
        throw OtherException(e);
      }
    } else {
      throw NetworkException();
    }
    return responseJson;
  }
}
