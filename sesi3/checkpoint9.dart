import 'dart:io';
void main() {
  bool isLoggedIn = false;
  stdout.write("Masukkan username: ");
  String? username = stdin.readLineSync();
  if (username == "admin") {
  isLoggedIn = true;
  }
  if (isLoggedIn) {
  print("Login berhasil! Selamat datang, $username.");
  } else {
  print("Login gagal! Username atau password salah.");
  }
  print("Tipe data dari isLoggedIn adalah: ${isLoggedIn.runtimeType}");
}