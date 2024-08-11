/// Enum yang merepresentasikan bahasa asli dari sebuah film atau konten.
///
/// Enum ini digunakan untuk menentukan bahasa asli yang digunakan
/// dalam film atau konten berdasarkan kode bahasa.
///
/// Anggota enum ini mencakup:
/// - [EN]: Bahasa Inggris ('en').
/// - [ES]: Bahasa Spanyol ('es').
/// - [JA]: Bahasa Jepang ('ja').
/// - [ZH]: Bahasa Mandarin ('zh').
enum OriginalLanguageEnum {
  /// Bahasa Inggris dengan kode bahasa 'en'.
  EN('en'),

  /// Bahasa Spanyol dengan kode bahasa 'es'.
  ES('es'),

  /// Bahasa Jepang dengan kode bahasa 'ja'.
  JA('ja'),

  /// Bahasa Mandarin dengan kode bahasa 'zh'.
  ZH('zh');

  /// String yang menyimpan nilai kode bahasa.
  /// Digunakan untuk menentukan bahasa asli dalam permintaan API atau penyajian data.
  final String value;

  /// Konstruktor enum yang menginisialisasi nilai [value] dengan
  /// string yang diberikan.
  const OriginalLanguageEnum(this.value);
}
