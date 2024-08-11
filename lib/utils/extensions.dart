import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daffa_movie_app/app/data/models/others/get_size.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:daffa_movie_app/utils/constants.dart' as app_const;

/// Mengambil ukuran layout tampilan dari konteks yang diberikan.
///
/// Fungsi ini menggunakan `MediaQuery` untuk mendapatkan ukuran layar saat ini
/// dan mengembalikan objek `GetSize` yang merepresentasikan lebar dan tinggi layar.
///
/// [ctx] adalah `BuildContext` yang digunakan untuk mengakses `MediaQuery`.
///
/// Mengembalikan objek `GetSize` yang berisi ukuran lebar dan tinggi dari layout.
///
/// Contoh penggunaan:
///
/// ```dart
/// GetSize layoutSize = getLayoutSize(context);
/// print('Lebar: ${layoutSize.width}, Tinggi: ${layoutSize.height}');
/// ```
GetSize getLayoutSize(final BuildContext ctx) {
  final Size size = MediaQuery.of(ctx).size;

  return GetSize(
    height: size.height,
    width: size.width,
  );
}

/// Mengecek koneksi internet saat ini.
///
/// Menggunakan [Connectivity] untuk memeriksa status koneksi.
/// Mengembalikan `true` jika ada koneksi, dan `false` jika tidak ada koneksi.
Future<bool> hasConnection() async {
  final List<ConnectivityResult> connectivityResults =
      await Connectivity().checkConnectivity();

  return !connectivityResults.contains(ConnectivityResult.none);
}

/// Mendapatkan detail dari tanggal sebagai daftar string.
///
/// Mengambil tahun, bulan, dan hari dari objek [DateTime]
/// dan mengembalikannya sebagai `Set<String>`.
Set<String> getDetailsFromDate(final DateTime date) => <String>{
      date.year.toString(),
      date.month.toString(),
      date.day.toString(),
    };

/// Menyimpan gambar ke penyimpanan lokal.
///
/// Mengunduh gambar dari URL dan menyimpannya di penyimpanan lokal.
/// Menyimpan nama file gambar di [SharedPreferences] jika berhasil diunduh.
/// Mengembalikan `true` jika penyimpanan berhasil, dan `false` jika gagal.
///
/// [imageUrl] URL gambar yang akan diunduh.
/// [imageId] ID gambar untuk menyimpan informasi nama file di [SharedPreferences].
Future<bool> saveImageToLocalStorage(
  final String? imageUrl, {
  required final int imageId,
}) async {
  final Dio dio = Dio();
  Logger logger = Logger();
  SharedPreferences preFs = await SharedPreferences.getInstance();

  if (imageUrl == null) return false;

  try {
    Directory documentDir = await getApplicationDocumentsDirectory();

    File file = File(
      path.join(
        documentDir.path,
        path.basename(imageUrl),
      ),
    );

    logger.i('file path -> ${file.path}');

    final String? existPoster = preFs.getString('posterImg_$imageId');

    logger.i('exist poster -> $existPoster');

    if (existPoster == null) {
      logger.i('Image data is not exist');
      final Response<dynamic> response = await dio.downloadUri(
        Uri.parse('${app_const.movieImgUrlFin}$imageUrl'),
        file.path,
        onReceiveProgress: (final int count, final int total) {
          logger
              .i('Image download progress -> ${(count / total * 100).ceil()}');
        },
      );

      if (response.statusCode == 200) {
        logger.i(response.data.toString());
        await preFs.setString('posterImg_$imageId', path.basename(imageUrl));
        return true;
      }
    } else {
      logger.i('Image data is exist');
      return true;
    }
  } catch (e) {
    logger.e('Save image to local storage is failed: $e');
  }
  return false;
}

/// Mengambil path gambar dari penyimpanan lokal.
///
/// Mengambil nama file gambar dari [SharedPreferences]
/// dan mengembalikan path lengkap dari gambar tersebut.
/// Mengembalikan string kosong jika data gambar tidak ditemukan.
///
/// [imageId] ID gambar untuk mengambil informasi nama file dari [SharedPreferences].
Future<String> getImageFromLocalStorage(
  final int imageId,
) async {
  Directory documentDir = await getApplicationDocumentsDirectory();
  Logger logger = Logger();
  SharedPreferences preFs = await SharedPreferences.getInstance();

  final String? data = preFs.getString('posterImg_$imageId');

  if (data == null || data.isEmpty) return '';

  File file = File(
    path.join(
      documentDir.path,
      data,
    ),
  );

  return file.path;
}
