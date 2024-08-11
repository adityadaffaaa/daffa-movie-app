/// `PromotionCarouselItem` adalah kelas model yang digunakan untuk merepresentasikan
/// sebuah item promosi dalam carousel.
///
/// Kelas ini menyimpan informasi mengenai gambar (`image`), judul (`title`),
/// dan deskripsi (`desc`) dari item promosi.
///
/// Contoh penggunaan:
///
/// ```dart
/// PromotionCarouselItem promotion = PromotionCarouselItem(
///   image: 'path/to/image.jpg',
///   title: 'Judul Promosi',
///   desc: 'Deskripsi singkat tentang promosi.',
/// );
/// ```

class PromotionCarouselItem {
  /// URL atau path dari gambar promosi.
  String image;

  /// Judul dari item promosi.
  String title;

  /// Deskripsi dari item promosi.
  String desc;

  /// Konstruktor untuk `PromotionCarouselItem`.
  ///
  /// [image] adalah URL atau path dari gambar promosi dan bersifat wajib.
  /// [title] adalah judul dari item promosi dan bersifat wajib.
  /// [desc] adalah deskripsi dari item promosi dan bersifat wajib.
  PromotionCarouselItem({
    required this.image,
    required this.title,
    required this.desc,
  });
}
