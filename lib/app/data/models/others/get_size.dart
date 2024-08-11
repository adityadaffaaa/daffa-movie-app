/// `GetSize` adalah kelas model yang digunakan untuk merepresentasikan ukuran
/// dari layout tampilan dengan menyimpan nilai lebar (`width`) dan tinggi (`height`).
///
/// Kelas ini berguna untuk menangani, menyimpan informasi ukuran dari
/// elemen atau tampilan di aplikasi, dan sebagai nilai kembalian dari fungsi `getLayoutSize`.
///
/// Contoh penggunaan:
///
/// ```dart
/// GetSize size = GetSize(
///   width: 200.0,
///   height: 400.0,
/// );
/// ```
class GetSize {
  /// Lebar dari layout tampilan.
  double width;

  /// Tinggi dari layout tampilan.
  double height;

  /// Konstruktor untuk `GetSize`.
  ///
  /// [width] adalah lebar dari layout tampilan dan bersifat wajib.
  /// [height] adalah tinggi dari layout tampilan dan bersifat wajib.
  GetSize({
    required this.height,
    required this.width,
  });
}
