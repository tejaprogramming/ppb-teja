void main() {
  // //increment ++
  // for (var i = 1; i <= 5; i++) {
  // print(i);
  // }

  // //decrement --
  // for (var i = 5; i >= 1; i--) {
  // print(i);
  // }

  // //bilangan genap
  // for (var i = 2; i <= 10; i += 2) {
  // print(i);
  // }

  // //perhitungan
  // for (var i = 1; i <= 5; i++) {
  // print('$i x 2 = ${i * 2}');
  // }

  final mahasiswa = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eta'];
  print('Daftar Mahasiswa:');
  for (var i = 0; i < mahasiswa.length; i++) {
  print('Mahasiswa ke-${i + 1}: ${mahasiswa[i]}');
  }
}