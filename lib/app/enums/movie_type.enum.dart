/// Enum yang merepresentasikan jenis film yang digunakan dalam permintaan API.
///
/// Enum ini digunakan untuk menentukan tipe film yang akan diambil
/// dari API seperti film populer atau film yang sedang tayang.
///
/// Anggota enum ini mencakup:
/// - [popular]: Film yang populer saat ini.
/// - [nowPlaying]: Film yang sedang tayang di bioskop.
enum MovieTypeEnum {
  /// Tipe film populer dengan nilai string 'popular'.
  popular('popular'),

  /// Tipe film yang sedang tayang dengan nilai string 'now_playing'.
  nowPlaying('now_playing');

  /// String yang menyimpan nilai tipe film.
  /// Digunakan untuk menentukan tipe film dalam permintaan API.
  final String value;

  /// Konstruktor enum yang menginisialisasi nilai [value] dengan
  /// string yang diberikan.
  const MovieTypeEnum(this.value);
}
