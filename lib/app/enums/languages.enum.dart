/// Enum yang merepresentasikan bahasa yang digunakan pada permintaan API film.
///
/// Enum ini digunakan untuk menentukan bahasa yang diinginkan
/// untuk digunakan dalam permintaan API film.
///
/// Anggota enum ini mencakup:
/// - [id]: Bahasa Indonesia (ID).
/// - [en]: Bahasa Inggris (US).

enum LanguagesEnum {
  /// Bahasa Indonesia dengan kode lokal 'id-ID'.
  id('id-ID'),

  /// Bahasa Inggris dengan kode lokal 'en-US'.
  en('en-US');

  /// String yang menyimpan nilai kode lokal bahasa.
  /// Digunakan untuk menentukan bahasa dalam permintaan API film.
  final String value;

  /// Konstruktor enum yang menginisialisasi nilai [value] dengan
  /// string yang diberikan.
  const LanguagesEnum(this.value);
}
