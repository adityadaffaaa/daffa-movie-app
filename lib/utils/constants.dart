import 'package:daffa_movie_app/app/enums/image_size.enum.dart';
import 'package:iconly/iconly.dart';

/// URL dasar untuk mengakses gambar dari TMDB
const String MOVIE_DB_IMAGE_URL = 'https://image.tmdb.org/t/p';

/// URL lengkap untuk gambar film dengan ukuran 'original'
///
/// Menggunakan konstanta URL dasar dan ukuran gambar dari `ImageSizeEnum`.
final String movieImgUrlFin =
    '$MOVIE_DB_IMAGE_URL/${ImageSizeEnum.original.value}';

/// Ukuran jarak dasar dalam aplikasi
///
/// Digunakan untuk pengaturan margin dan padding di seluruh aplikasi.
const double baseGapSize = 24;

/// Radius dasar untuk sudut melengkung
///
/// Digunakan untuk memberikan efek sudut melengkung pada elemen UI.
const double baseRadius = 8;

/// Padding dasar untuk elemen UI
///
/// Digunakan untuk memberikan jarak antara elemen UI di seluruh aplikasi.
const double basePadSize = 16;

/// Daftar menu pengaturan
///
/// Menyimpan informasi tentang menu pengaturan yang ditampilkan di aplikasi.
/// Setiap entri dalam daftar adalah peta dengan kunci `title` dan `icon`.
const List<Map<String, dynamic>> settingMenus = <Map<String, dynamic>>[
  <String, dynamic>{
    'title': 'Language',
    'icon': IconlyLight.arrow_right_2,
  },
  <String, dynamic>{
    'title': 'Security',
    'icon': IconlyLight.arrow_right_2,
  },
  <String, dynamic>{
    'title': 'Watchlist Movie',
    'icon': IconlyLight.arrow_right_2,
  },
  <String, dynamic>{
    'title': 'Favorite Movie',
    'icon': IconlyLight.arrow_right_2,
  },
  <String, dynamic>{
    'title': 'FAQ',
    'icon': IconlyLight.login,
  },
  <String, dynamic>{
    'title': 'Terms Of Service',
    'icon': IconlyLight.login,
  },
  <String, dynamic>{
    'title': 'Privacy Policy',
    'icon': IconlyLight.login,
  },
];
