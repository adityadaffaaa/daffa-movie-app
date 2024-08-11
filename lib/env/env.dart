// Environtment untuk konfigurasi aplikasi

/// Token akses untuk autentikasi API The Movie Database (TMDb).
/// Token ini digunakan untuk mengautentikasi permintaan yang dibuat ke API TMDb.
const String MOVIE_DB_ACCESS_TOKEN_AUTH =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjUwY2Y3OWFlYmEwNDc1Yzk4YzY3YjA1NjUwYTg4MSIsIm5iZiI6MTcyMzEyMzc5Ny4xNTA0MTYsInN1YiI6IjYzYmZkZTFjMjNiZTQ2MDA5ODA4ODg4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-8uWo9waw6DtTzWKd21x7gVsHO4XATYkjk7gspNPQlg';

/// Kunci API untuk The Movie Database.
/// Kunci ini digunakan untuk mengidentifikasi aplikasi saat melakukan permintaan ke API TMDb.

const String MOVIE_DB_API_KEY = '6250cf79aeba0475c98c67b05650a881';

/// URL dasar dari API The Movie Database.
/// Digunakan sebagai basis untuk membangun URL endpoint API TMDb.
const String MOVIE_DB_BASE_URL = 'https://api.themoviedb.org';

/// Versi API The Movie Database yang digunakan.
/// Versi ini ditambahkan ke URL dasar untuk mengakses versi yang sesuai dari API TMDb.
const String MOVIE_DB_VERSION = '/3';

/// ID akun pengguna di The Movie Database.
/// ID ini digunakan untuk mengidentifikasi akun tertentu dalam API TMDb, biasanya untuk permintaan terkait pengguna.
const int ACCOUNT_ID = 16966382;
