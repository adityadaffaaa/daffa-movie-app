/// `MovieItem` adalah kelas model yang digunakan untuk merepresentasikan
/// informasi mengenai sebuah item film.
///
/// Kelas ini menyimpan informasi tentang gambar (`image`) dan judul (`title`)
/// dari film yang ditampilkan.
///
/// Contoh penggunaan:
///
/// ```dart
/// MovieItem movie = MovieItem(
///   image: 'path/to/image.jpg',
///   title: 'Judul Film',
/// );
/// ```

class MovieItem {
  /// URL atau path dari gambar film.
  String image;

  /// Judul film.
  String title;

  /// Konstruktor untuk `MovieItem`.
  ///
  /// [image] adalah URL atau path dari gambar film yang bersifat wajib.
  /// [title] adalah judul film yang bersifat wajib.
  MovieItem({
    required this.image,
    required this.title,
  });
}
