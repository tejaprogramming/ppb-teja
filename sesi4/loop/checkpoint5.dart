void main() {
  final produk = ['Apel', 'Pisang', 'Semangka', 'Nangka'];
  
  for (final item in produk) {
    print('Mencari: $item');

    if (item == 'Pisang') {
      print('Produk telah dimakan oleh monyet!');
      break;
    }
  }
}
