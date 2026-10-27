import 'fitur.dart';
import 'input.dart';

void main() {
  print('\n=== Absensi Kelas ===');
  var berjalan = true;

  while (berjalan) {
    print('');
    print('1. Lihat daftar mahasiswa');
    print('2. Catat absensi pertemuan baru');
    print('3. Lihat absensi per pertemuan');
    print('4. Tambah mahasiswa');
    print('5. Cari mahasiswa (nama)');
    print('6. Ubah status absensi');
    //fitur butuh dikonfigurasi lanjutan
    // print('7. Rekap per mahasiswa             [Sedang]');
    // print('8. Persentase kehadiran            [Sulit]');
    // print('9. Mahasiswa di bawah batas hadir  [Sulit]');
    print('0. Keluar');

    final pilihan = bacaInt('Pilih menu', min: 0, max: 9);
    switch (pilihan) {
      case 1:
        tampilkanDaftar();
      case 2:
        catatAbsensi();
      case 3:
        tampilkanAbsensiPertemuan();
      case 4:
        tambahMahasiswa();
      case 5:
        cariMahasiswa();
      case 6:
        ubahStatus();
      //fitur butuh dikonfigurasi lanjutan
      // case 7:
      //   tampilkanRekap();
      // case 8:
      //   tampilkanPersentase();
      // case 9:
      //   tampilkanDiBawahBatas();
      case 0:
        berjalan = false;
    }
  }

  print('Terima kasih.');
}
