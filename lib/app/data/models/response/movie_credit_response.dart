/// `MovieCreditResponse` adalah kelas model yang digunakan untuk merepresentasikan
/// respons yang berisi informasi kredit film, termasuk ID film dan daftar cast.
///
/// Kelas ini menyimpan ID film dan informasi tentang cast yang terlibat dalam film.
///
/// Contoh penggunaan:
///
/// ```dart
/// MovieCreditResponse response = MovieCreditResponse.fromJson(jsonResponse);
/// ```
class MovieCreditResponse {
  /// ID film.
  final int id;

  /// Daftar cast yang terlibat dalam film.
  final List<Cast> cast;

  /// Konstruktor untuk `MovieCreditResponse`.
  ///
  /// [id] adalah ID film dan bersifat wajib.
  /// [cast] adalah daftar cast yang terlibat dalam film dan bersifat wajib.
  MovieCreditResponse({
    required this.id,
    required this.cast,
  });

  /// Mengubah objek `MovieCreditResponse` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'cast': cast.map((final Cast x) => x.toJson()).toList(),
      };

  /// Membuat objek `MovieCreditResponse` dari JSON.
  ///
  /// [map] adalah peta JSON yang berisi data untuk membuat objek.
  factory MovieCreditResponse.fromJson(final Map<String, dynamic> map) =>
      MovieCreditResponse(
        id: map['id'] as int,
        cast: List<Cast>.from(
          (map['cast'] as List<dynamic>).map<Cast>(
            (final dynamic x) => Cast.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );
}

/// `Cast` adalah kelas model yang digunakan untuk merepresentasikan informasi
/// tentang cast film.
///
/// Kelas ini menyimpan informasi tentang cast seperti apakah cast tersebut dewasa,
/// gender, ID, nama, nama asli, popularitas, path profil, dan departemen yang dikenal.
///
/// Contoh penggunaan:
///
/// ```dart
/// Cast castMember = Cast.fromJson(jsonResponse);
/// ```
class Cast {
  /// Menunjukkan apakah cast adalah dewasa.
  final bool adult;

  /// Gender cast
  final int gender;

  /// ID unik dari cast.
  final int id;

  /// Nama cast.
  final String name;

  /// Nama asli cast.
  final String originalName;

  /// Popularitas cast.
  final double popularity;

  /// Path profil cast, bisa bernilai null.
  final String? profilePath;

  /// Departemen yang dikenal cast.
  final String departMent;

  /// Konstruktor untuk `Cast`.
  ///
  /// [adult] adalah flag yang menunjukkan apakah cast adalah dewasa dan bersifat wajib.
  /// [gender] adalah gender cast dan bersifat wajib.
  /// [id] adalah ID cast dan bersifat wajib.
  /// [name] adalah nama cast dan bersifat wajib.
  /// [originalName] adalah nama asli cast dan bersifat wajib.
  /// [popularity] adalah popularitas cast dan bersifat wajib.
  /// [profilePath] adalah path profil cast dan bersifat opsional.
  /// [departMent] adalah departemen yang dikenal cast dan bersifat wajib.
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.departMent,
  });

  /// Membuat objek `Cast` dari JSON.
  ///
  /// [map] adalah peta JSON yang berisi data untuk membuat objek.
  factory Cast.fromJson(final Map<String, dynamic> map) => Cast(
        adult: map['adult'] as bool,
        gender: map['gender'] as int,
        id: map['id'] as int,
        name: map['name'] as String,
        originalName: map['original_name'] as String,
        popularity: map['popularity'] as double,
        profilePath:
            map['profile_path'] != null ? map['profile_path'] as String : null,
        departMent: map['known_for_department'] as String,
      );

  /// Mengubah objek `Cast` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'adult': adult,
        'gender': gender,
        'id': id,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'known_for_department': departMent,
      };
}
