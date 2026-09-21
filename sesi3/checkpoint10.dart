void main() {
  var mahasiswa = ["Budi", "Ani", "Citra"];

  print("Jumlah mahasiswa: ${mahasiswa.length}");
  print("Mahasiswa pertama: ${mahasiswa[0]}");

  mahasiswa[1] = "Andi"; // update data
  print(mahasiswa);
}