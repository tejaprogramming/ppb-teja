void main() {
  final angkatan = <int, List<String>>{
    2026: ['Lusy', 'Mery', 'Teja', 'Ajeng'],
    2027: ['Alexander the Great', 'Kaisar Qin', 'Poseidon', 'Zeus'],
  };
  outerLoop:
  for (final tahun in angkatan.keys) {
    for (final mhs in angkatan[tahun]!) {
      print('Angkatan $tahun - $mhs');
      if (mhs == 'Poseidon') {
        print('Tahan Poseidon!!');
        break outerLoop; // Hentikan semua loop.
      }
    }
  }
}
