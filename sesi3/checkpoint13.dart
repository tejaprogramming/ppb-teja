void main() {
  // List berisi Map (setiap Map merepresentasikan data mahasiswa)
  List<Map<String, dynamic>> mahasiswa = [
    {
      'nama': 'Andi',
      'nim': 'A001',
      'nilai': 85,
    },
    {
      'nama': 'Budi',
      'nim': 'A002',
      'nilai': 90,
    },
    {
      'nama': 'Citra',
      'nim': 'A003',
      'nilai': 78,
    },
  ];
  // Menampilkan semua data mahasiswa
  print('=== Daftar Mahasiswa ===');
  for (var mhs in mahasiswa) {
    print('Nama : ${mhs['nama']} | NIM : ${mhs['nim']} | Nilai : ${mhs['nilai']}');
  }
}