void main() {
  final mahasiswa = ['Andi', 'Budi', 'Citra', 'Dewi'];
  for (final mhs in mahasiswa) {
    if (mhs == 'Citra') {
      print('Data Citra ditemukan, hentikan pencarian.');
      break; // Berhenti loop.
    }
    print('Memeriksa: $mhs');
  }
  print('\nLewati mahasiswa yang bernama Budi:');
  for (final mhs in mahasiswa) {
    if (mhs == 'Budi') {
      continue; // Lewati iterasi ini.
    }
    print('Mahasiswa: $mhs');
  }
}
