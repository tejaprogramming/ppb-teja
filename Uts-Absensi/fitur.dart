import 'data.dart';
import 'input.dart';

// ============================================================
// Fungsi bantu
// ============================================================

/// Mencari mahasiswa berdasarkan NIM. Mengembalikan null jika tidak ada.
Map<String, dynamic>? cariByNim(String nim) {
  for (final mhs in daftarMahasiswa) {
    if (mhs['nim'] == nim) return mhs;
  }
  return null;
}

/// Mencetak satu baris data mahasiswa.
void cetakMahasiswa(Map<String, dynamic> mhs) {
  print('${mhs['nim']} | ${mhs['nama']}');
}

/// Meminta pengguna memilih status kehadiran.
StatusHadir bacaStatus(String label) {
  final pilihan = bacaInt(
    '$label (1=hadir, 2=izin, 3=sakit, 4=alpa)',
    min: 1,
    max: 4,
  );
  return switch (pilihan) {
    1 => StatusHadir.hadir,
    2 => StatusHadir.izin,
    3 => StatusHadir.sakit,
    _ => StatusHadir.alpa,
  };
}

// ============================================================
// Fitur yang sudah jadi
// ============================================================

/// Menu 1: menampilkan semua mahasiswa.
void tampilkanDaftar() {
  print('\n=== Daftar Mahasiswa ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    cetakMahasiswa(mhs);
  }
}

/// Menu 2: mencatat absensi untuk pertemuan berikutnya.
void catatAbsensi() {
  final nomor = absensi.length + 1;
  print('\n=== Catat Absensi Pertemuan $nomor ===');
  final Map<String, StatusHadir> data = {};
  for (final mhs in daftarMahasiswa) {
    data[mhs['nim'] as String] = bacaStatus('Status ${mhs['nama']}');
  }
  absensi[nomor] = data;
  print('Absensi pertemuan $nomor tersimpan.');
}

/// Menu 3: menampilkan absensi pada satu pertemuan.
void tampilkanAbsensiPertemuan() {
  print('\n=== Absensi per Pertemuan ===');
  if (absensi.isEmpty) {
    print('Belum ada absensi.');
    return;
  }
  final nomor = bacaInt('Nomor pertemuan', min: 1, max: absensi.length);
  final data = absensi[nomor]!;
  print('Pertemuan $nomor:');
  for (final mhs in daftarMahasiswa) {
    final status = data[mhs['nim']];
    print('${mhs['nim']} | ${mhs['nama']} | ${status?.name ?? '-'}');
  }
}

// ============================================================
// Fitur pilihan (pilih minimal 3, lihat README.md)
// ============================================================

/// Menu 4 [Mudah]: menambah mahasiswa baru.
void tambahMahasiswa() {
  // TODO: minta NIM dan nama. Tolak jika NIM sudah terdaftar (pakai cariByNim).
  // Tambahkan ke daftarMahasiswa.
  print('\n=== Tambah Mahasiswa ===');
  final nim = bacaTeks('NIM');
  if (cariByNim(nim) != null) {
    print('NIM $nim sudah terdaftar.');
  }
  final nama = bacaTeks('Nama');
  daftarMahasiswa.add({'nim': nim, 'nama': nama});
  print('Mahasiswa $nama berhasil ditambahkan.');
}

/// Menu 5 [Mudah]: mencari mahasiswa berdasarkan sebagian nama.
void cariMahasiswa() {
  // TODO: minta kata kunci, tampilkan semua mahasiswa yang namanya mengandung
  // kata kunci tersebut (huruf besar/kecil tidak dibedakan).
  print('\n=== Cari Mahasiswa ===');
  final kataKunci = bacaTeks('Nama').toLowerCase();
  var ditemukan = false;

  for (final mhs in daftarMahasiswa) {
    final nama = (mhs['nama'] as String).toLowerCase();
    if (nama.contains(kataKunci)) {
      cetakMahasiswa(mhs);
      ditemukan = true;
    }
  }
  if (!ditemukan) {
    print('Mahasiswa tidak ditemukan.');
  }
}

/// Menu 6 [Sedang]: mengubah status absensi seorang mahasiswa.
void ubahStatus() {
  // TODO: minta nomor pertemuan, NIM, dan status baru (pakai bacaStatus).
  // Simpan status baru ke absensi[nomor].
  print('\n=== Ubah Status Absensi ===');
  if (absensi.isEmpty) {
    print('Belum ada absensi.');
    return;
  }
  final nomor = bacaInt('Nomor pertemuan', min: 1, max: absensi.length);
  final nim = bacaTeks('NIM');
  final mhs = cariByNim(nim);
  if (mhs == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }
  final statusBaru = bacaStatus('Status baru');
  absensi[nomor]![nim] = statusBaru;
  print(
    'Status ${mhs['nama']} pada pertemuan $nomor diubah menjadi ${statusBaru.name}.',
  );
}

// Menu 7 [Sedang]: menampilkan jumlah setiap status per mahasiswa.
void tampilkanRekap() {
  // TODO: untuk setiap mahasiswa, hitung berapa kali hadir, izin, sakit, dan alpa
  // dari semua pertemuan.
  final totalPertemuan = absensi.length;
  print('\n=== Rekap Absensi ($totalPertemuan pertemuan) ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    final nama = mhs['nama'] as String;
    int hadir = 0;
    int izin = 0;
    int sakit = 0;
    int alpa = 0;
    for (final dataPertemuan in absensi.values) {
      final status = dataPertemuan[nim];
      switch (status) {
        case StatusHadir.hadir:
          hadir++;
        case StatusHadir.izin:
          izin++;
        case StatusHadir.sakit:
          sakit++;
        case StatusHadir.alpa:
          alpa++;
        case null:
          break;
      }
    }
    print('$nama | hadir $hadir | izin $izin | sakit $sakit | alpa $alpa');
  }
  print('Fitur belum tersedia.');
}

/// Menu 8 [Sulit]: menampilkan persentase kehadiran setiap mahasiswa.
void tampilkanPersentase() {
  // TODO: persentase = jumlah hadir / jumlah pertemuan x 100.
  // Tampilkan 1 angka di belakang koma.
  final totalPertemuan = absensi.length;
  print('\n=== Persentase Kehadiran ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    final nama = mhs['nama'] as String;
    int jumlahHadir = 0;
    for (final dataPertemuan in absensi.values) {
      if (dataPertemuan[nim] == StatusHadir.hadir) {
        jumlahHadir++;
      }
    }
    final persentase = totalPertemuan > 0 
        ? (jumlahHadir / totalPertemuan) * 100 
        : 0.0;

    print('$nama | $jumlahHadir/$totalPertemuan pertemuan | ${persentase.toStringAsFixed(1)}%');
  }
}

/// Menu 9 [Sulit]: menampilkan mahasiswa dengan kehadiran di bawah batas.
void tampilkanDiBawahBatas() {
  // TODO: tampilkan mahasiswa yang persentase kehadirannya < batasKehadiran
  // (lihat data.dart) beserta persentasenya.
  final totalPertemuan = absensi.length;
  final batasFormatted = batasKehadiran.toStringAsFixed(0);
  print('\n=== Kehadiran di Bawah $batasFormatted% ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  var adaDiBawahBatas = false;
  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    final nama = mhs['nama'] as String;
    int jumlahHadir = 0;
    for (final dataPertemuan in absensi.values) {
      if (dataPertemuan[nim] == StatusHadir.hadir) {
        jumlahHadir++;
      }
    }
    final persentase = totalPertemuan > 0 
        ? (jumlahHadir / totalPertemuan) * 100 
        : 0.0;

    if (persentase < batasKehadiran) {
      print('$nama | ${persentase.toStringAsFixed(1)}%');
      adaDiBawahBatas = true;
    }
  }
  if (!adaDiBawahBatas) {
    print('Tidak ada mahasiswa di bawah batas kehadiran.');
  }
}