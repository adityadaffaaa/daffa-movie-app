import 'package:daffa_movie_app/app/enums/original_language.enum.dart';

/// `MovieItemResponse` adalah kelas model yang digunakan untuk merepresentasikan
/// respons dari API yang berisi data film.
///
/// Kelas ini menyimpan informasi tentang halaman, hasil film, dan jumlah total halaman
/// dan hasil film.
///
/// Contoh penggunaan:
///
/// ```dart
/// MovieItemResponse response = MovieItemResponse.fromJson(jsonResponse);
/// ```
class MovieItemResponse {
  // Tanggal mulai dan akhir untuk data film.
  final Dates? dates;

  /// Nomor halaman saat ini.
  final int page;

  /// Daftar hasil film yang terkait dengan respons.
  final List<MovieResult> results;

  /// Jumlah total halaman.
  final int totalPages;

  /// Jumlah total hasil film.
  final int totalResults;

  /// Konstruktor untuk `MovieItemResponse`.
  ///
  /// [page] adalah nomor halaman dan bersifat wajib.
  /// [results] adalah daftar hasil film dan bersifat wajib.
  /// [totalPages] adalah jumlah total halaman dan bersifat wajib.
  /// [totalResults] adalah jumlah total hasil film dan bersifat wajib.
  /// [dates] adalah tanggal mulai dan akhir, bersifat opsional.
  MovieItemResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    this.dates,
  });

  /// Membuat objek `MovieItemResponse` dari JSON.
  ///
  /// [json] adalah peta JSON yang berisi data untuk membuat objek.
  factory MovieItemResponse.fromJson(final Map<String, dynamic> json) =>
      MovieItemResponse(
        dates: json['dates'] != null
            ? Dates.fromJson(
                json['dates'] as Map<String, dynamic>,
              )
            : null,
        page: json['page'] as int,
        results: (json['results'] as List<dynamic>)
            .map(
              (final dynamic i) =>
                  MovieResult.fromJson(i as Map<String, dynamic>),
            )
            .toList(),
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
      );

  /// Mengubah objek `MovieItemResponse` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'dates': dates?.toJson(),
        'page': page,
        'results': results.map((final MovieResult i) => i.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}

/// `Dates` adalah kelas model yang digunakan untuk merepresentasikan
/// rentang tanggal yang terkait dengan data film.
///
/// Kelas ini menyimpan tanggal maksimum dan minimum.
///
/// Contoh penggunaan:
///
/// ```dart
/// Dates dates = Dates.fromJson(jsonResponse);
/// ```
class Dates {
  /// Tanggal maksimum.
  final DateTime maximum;

  /// Tanggal minimum.
  final DateTime minimum;

  /// Konstruktor untuk `Dates`.
  ///
  /// [maximum] adalah tanggal maksimum dan bersifat wajib.
  /// [minimum] adalah tanggal minimum dan bersifat wajib.
  Dates({
    required this.maximum,
    required this.minimum,
  });

  /// Membuat objek `Dates` dari JSON.
  ///
  /// [json] adalah peta JSON yang berisi data untuk membuat objek.
  factory Dates.fromJson(final Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json['maximum'] as String),
        minimum: DateTime.parse(json['minimum'] as String),
      );

  /// Mengubah objek `Dates` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'maximum': maximum.toIso8601String(),
        'minimum': minimum.toIso8601String(),
      };
}

/// `MovieResult` adalah kelas model yang digunakan untuk merepresentasikan
/// informasi tentang hasil film.
///
/// Kelas ini menyimpan berbagai detail film seperti ID, judul, bahasa asli,
/// popularitas, dan lainnya.
///
/// Contoh penggunaan:
///
/// ```dart
/// MovieResult movie = MovieResult.fromJson(jsonResponse);
/// ```
class MovieResult {
  /// Menunjukkan apakah film tersebut ditujukan untuk dewasa.
  final bool adult;

  /// Path gambar latar belakang film.
  final String? backdropPath;

  /// Daftar ID genre yang terkait dengan film.
  final List<int> genreIds;

  /// ID unik film.
  final int id;

  /// Bahasa asli film.
  final OriginalLanguageEnum originalLanguage;

  /// Judul asli film.
  final String originalTitle;

  /// Ringkasan atau sinopsis film.
  final String overview;

  /// Popularitas film.
  final double popularity;

  /// Path gambar poster film.
  final String? posterPath;

  /// Tanggal rilis film.
  final DateTime? releaseDate;

  /// Judul film.
  final String title;

  /// Menunjukkan apakah film tersebut adalah video.
  final bool video;

  /// Rata-rata penilaian film.
  final double voteAverage;

  /// Jumlah total penilaian film.
  final int voteCount;

  /// Menunjukkan apakah film ini adalah favorit.
  bool isFavorite;

  /// Menunjukkan apakah film ini ada dalam watchlist.
  bool isWatchlist;

  /// Konstruktor untuk `MovieResult`.
  ///
  /// [adult] menunjukkan apakah film tersebut ditujukan untuk dewasa dan bersifat wajib.
  /// [backdropPath] adalah path gambar latar belakang film, bersifat opsional.
  /// [genreIds] adalah daftar ID genre, bersifat wajib.
  /// [id] adalah ID unik film, bersifat wajib.
  /// [originalLanguage] adalah bahasa asli film, bersifat wajib.
  /// [originalTitle] adalah judul asli film, bersifat wajib.
  /// [overview] adalah sinopsis film, bersifat wajib.
  /// [popularity] adalah popularitas film, bersifat wajib.
  /// [posterPath] adalah path gambar poster film, bersifat opsional.
  /// [releaseDate] adalah tanggal rilis film, bersifat opsional.
  /// [title] adalah judul film, bersifat wajib.
  /// [video] menunjukkan apakah film tersebut adalah video, bersifat wajib.
  /// [voteAverage] adalah rata-rata penilaian film, bersifat wajib.
  /// [voteCount] adalah jumlah total penilaian film, bersifat wajib.
  /// [isFavorite] menunjukkan apakah film ini adalah favorit, default adalah false.
  /// [isWatchlist] menunjukkan apakah film ini ada dalam daftar tontonan, default adalah false.
  MovieResult({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.isFavorite = false,
    this.isWatchlist = false,
  });

  /// Membuat objek `MovieResult` dari JSON.
  ///
  /// [json] adalah peta JSON yang berisi data untuk membuat objek.
  factory MovieResult.fromJson(final Map<String, dynamic> json) => MovieResult(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] != null
            ? json['backdrop_path'] as String
            : null,
        genreIds: List<int>.from(json['genre_ids'] as List<dynamic>),
        id: json['id'] as int,
        originalLanguage: OriginalLanguageEnum.values.firstWhere(
          (final OriginalLanguageEnum e) =>
              e.value == json['original_language'],
        ),
        originalTitle: json['original_title'] as String,
        overview: json['overview'] as String,
        popularity: json['popularity'].toDouble() as double,
        posterPath:
            json['poster_path'] != null ? json['poster_path'] as String : null,
        releaseDate: json['release_date'] == null || json['release_date'] == ''
            ? null
            : DateTime.parse(json['release_date'] as String),
        title: json['title'] as String,
        video: json['video'] as bool,
        voteAverage: json['vote_average'].toDouble() as double,
        voteCount: json['vote_count'] as int,
      );

  /// Mengubah objek `MovieResult` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage.value.toString(),
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate?.toIso8601String(),
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
