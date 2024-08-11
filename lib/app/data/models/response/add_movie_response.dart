/// `AddMovieResponse` adalah kelas model yang digunakan untuk merepresentasikan
/// respons dari operasi penambahan film.
///
/// Kelas ini menyimpan informasi mengenai status dari operasi penambahan film,
/// termasuk apakah operasi berhasil, kode status, dan pesan status.
///
/// Contoh penggunaan:
///
/// ```dart
/// AddMovieResponse response = AddMovieResponse.fromJson(jsonResponse);
/// ```
class AddMovieResponse {
  /// Menunjukkan apakah operasi adding/remove film berhasil.
  bool success;

  /// Kode status dari respons.
  int statusCode;

  /// Pesan status yang terkait dengan respons.
  String statusMessage;

  /// Konstruktor untuk `AddMovieResponse`.
  ///
  /// [success] adalah flag yang menunjukkan keberhasilan operasi dan bersifat wajib.
  /// [statusCode] adalah kode status dari respons dan bersifat wajib.
  /// [statusMessage] adalah pesan status dari respons dan bersifat wajib.
  AddMovieResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  /// Membuat objek `AddMovieResponse` dari JSON.
  ///
  /// [map] adalah peta JSON yang berisi data untuk membuat objek.
  factory AddMovieResponse.fromJson(final Map<String, dynamic> map) =>
      AddMovieResponse(
        success: map['success'] as bool,
        statusCode: map['status_code'] as int,
        statusMessage: map['status_message'] as String,
      );

  /// Mengubah objek `AddMovieResponse` menjadi JSON.
  ///
  /// Mengembalikan peta JSON yang berisi data objek.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'success': success,
        'status_code': statusCode,
        'status_message': statusMessage,
      };
}
