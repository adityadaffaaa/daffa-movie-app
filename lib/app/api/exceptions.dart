/// `ApiException` adalah kelas dasar untuk semua jenis pengecualian
/// yang mungkin terjadi saat melakukan permintaan API.
///
/// Pengecualian ini dapat digunakan untuk menampilkan pesan kesalahan
/// yang terkait dengan permintaan API yang gagal.
///
/// [message] adalah pesan kesalahan yang dapat disesuaikan.
class ApiException implements Exception {
  /// Pesan kesalahan yang terkait dengan pengecualian.
  final dynamic _message;

  /// Konstruktor untuk `ApiException`.
  ///
  /// [message] adalah pesan kesalahan yang bersifat opsional.
  ApiException([
    this._message,
  ]);

  /// Mengembalikan representasi string dari objek ini.
  ///
  /// Digunakan untuk menampilkan pesan kesalahan saat pengecualian ini dilempar.
  @override
  String toString() => '$_message';
}

/// `NetworkException` adalah kelas pengecualian yang digunakan
/// ketika tidak ada koneksi internet yang tersedia.
///
/// Secara default, pesan kesalahan yang ditampilkan adalah 'Not internet connection'.
class NetworkException extends ApiException {
  /// Konstruktor untuk `NetworkException`.
  ///
  /// [message] adalah pesan kesalahan yang bersifat opsional.
  NetworkException([
    String super.message = 'Not internet connection',
  ]);
}

/// `OtherException` adalah kelas pengecualian yang digunakan
/// untuk menangani kesalahan lain yang mungkin terjadi selama permintaan API.
///
/// Pesan kesalahan dapat disesuaikan sesuai dengan kondisi kesalahan yang terjadi.
class OtherException extends ApiException {
  /// Konstruktor untuk `OtherException`.
  ///
  /// [message] adalah pesan kesalahan yang bersifat opsional.
  OtherException([
    super.message,
  ]);
}
