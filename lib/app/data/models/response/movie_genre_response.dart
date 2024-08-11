/// `MovieGenreResponse` adalah kelas model yang digunakan untuk merepresentasikan
/// respons yang berisi daftar genre film.
///
/// Kelas ini menyimpan daftar genre yang terkait dengan film.
///
/// Contoh penggunaan:
///
/// ```dart
/// MovieGenreResponse response = MovieGenreResponse.fromJson(jsonResponse);
/// ```
class MovieGenreResponse {
  /// Daftar genre film.
  final List<Genre> genres;

  /// Konstruktor untuk `MovieGenreResponse`.
  ///
  /// [genres] adalah daftar genre film yang terlibat dan bersifat wajib.
  MovieGenreResponse({
    required this.genres,
  });

  /// Membuat objek `MovieGenreResponse` dari JSON.
  ///
  /// [json] adalah peta JSON yang berisi data untuk membuat objek.
  factory MovieGenreResponse.fromJson(final Map<String, dynamic> json) =>
      MovieGenreResponse(
        genres: List<Genre>.from(
          (json['genres'] as List<dynamic>).map<Genre>(
            (final dynamic x) => Genre.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  /// Mengubah objek `MovieGenreResponse` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'genres': genres.map((final Genre x) => x.toJson()).toList(),
      };
}

/// `Genre` adalah kelas model yang digunakan untuk merepresentasikan informasi
/// tentang genre film.
///
/// Kelas ini menyimpan ID dan nama genre.
///
/// Contoh penggunaan:
///
/// ```dart
/// Genre genre = Genre.fromJson(jsonResponse);
/// ```
class Genre {
  /// ID genre.
  final int id;

  /// Nama genre.
  final String name;

  /// Konstruktor untuk `Genre`.
  ///
  /// [id] adalah ID genre dan bersifat wajib.
  /// [name] adalah nama genre dan bersifat wajib.
  Genre({
    required this.id,
    required this.name,
  });

  /// Membuat objek `Genre` dari JSON.
  ///
  /// [json] adalah peta JSON yang berisi data untuk membuat objek.
  factory Genre.fromJson(final Map<String, dynamic> json) => Genre(
        id: json['id'] as int,
        name: json['name'] as String,
      );

 /// Mengubah objek `Genre` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
