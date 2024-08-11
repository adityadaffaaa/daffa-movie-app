/// Enum yang merepresentasikan berbagai ukuran/resolusi gambar.
///
/// Enum ini digunakan untuk menentukan ukuran gambar yang diinginkan
/// untuk digunakan dalam aplikasi. Berbagai ukuran yang tersedia
/// mencakup ukuran asli serta ukuran dengan lebar yang berbeda-beda.
///
/// Anggota enum ini mencakup:
/// - [original]: Ukuran gambar asli tanpa perubahan.
/// - [w500]: Gambar dengan lebar 500 piksel.
/// - [w400]: Gambar dengan lebar 400 piksel.
/// - [w300]: Gambar dengan lebar 300 piksel.
/// - [w200]: Gambar dengan lebar 200 piksel.
/// - [w100]: Gambar dengan lebar 100 piksel.

enum ImageSizeEnum {
  /// Ukuran gambar asli tanpa perubahan.
  original('original'),

  /// Gambar dengan lebar 500 piksel.
  w500('w500'),

  /// Gambar dengan lebar 400 piksel.
  w400('w400'),

  /// Gambar dengan lebar 300 piksel.
  w300('w300'),

  /// Gambar dengan lebar 200 piksel.
  w200('w200'),

  /// Gambar dengan lebar 100 piksel.
  w100('w100');

  /// String yang menyimpan nilai ukuran gambar.
  /// Digunakan untuk menentukan ukuran gambar dalam permintaan API
  /// atau dalam operasi terkait gambar lainnya.
  final String value;

  /// Konstruktor enum yang menginisialisasi nilai [value] dengan
  /// string yang diberikan.
  const ImageSizeEnum(this.value);
}
