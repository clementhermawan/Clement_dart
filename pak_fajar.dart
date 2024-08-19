void main() {
  KoleksiBuku koleksiBuku = KoleksiBuku();

  // Menambahkan buku ke koleksi
  koleksiBuku.masukkanBuku(Novel('The Catcher in the Rye', 'J.D. Salinger'));
  koleksiBuku.masukkanBuku(Novel('To Kill a Mockingbird', 'Harper Lee'));
  koleksiBuku.masukkanBuku(Novel('1984', 'George Orwell'));

  // Menampilkan daftar buku
  koleksiBuku.lihatBuku();

  // Meminjam buku
  koleksiBuku.ambilBuku('1984');

  // Menampilkan daftar buku setelah peminjaman
  koleksiBuku.lihatBuku();

  // Mengembalikan buku
  koleksiBuku.kembaliBuku('1984');

  // Menampilkan daftar buku setelah pengembalian
  koleksiBuku.lihatBuku();

  // Contoh closure dan fungsi anonim
  var jumlahBuku = koleksiBuku.tambahJumlah(2);
  print('Jumlah buku setelah ditambah: ${jumlahBuku(3)}');
}

class Novel {
  String namaBuku;
  String penulisBuku;
  bool sedangDipinjam;

  Novel(this.namaBuku, this.penulisBuku, {this.sedangDipinjam = false});
}

class KoleksiBuku {
  List<Novel> daftarBuku = [];

  // Menambahkan buku ke koleksi
  void masukkanBuku(Novel buku) {
    daftarBuku.add(buku);
    print('Buku masuk: ${buku.namaBuku}');
  }

  // Meminjam buku
  void ambilBuku(String nama) {
    for (var buku in daftarBuku) {
      if (buku.namaBuku == nama && !buku.sedangDipinjam) {
        buku.sedangDipinjam = true;
        print('Buku dipinjam: $nama');
        return;
      }
    }
    print('Buku tidak ditemukan atau sedang dipinjam: $nama');
  }

  // Mengembalikan buku
  void kembaliBuku(String nama) {
    for (var buku in daftarBuku) {
      if (buku.namaBuku == nama && buku.sedangDipinjam) {
        buku.sedangDipinjam = false;
        print('Buku dikembalikan: $nama');
        return;
      }
    }
    print('Buku tidak ditemukan untuk dikembalikan: $nama');
  }

  // Menampilkan daftar buku
  void lihatBuku() {
    print('Buku yang tersedia:');
    for (var buku in daftarBuku) {
      if (!buku.sedangDipinjam) {
        print('${buku.namaBuku} oleh ${buku.penulisBuku}');
      }
    }
    print('Buku yang sedang dipinjam:');
    for (var buku in daftarBuku) {
      if (buku.sedangDipinjam) {
        print('${buku.namaBuku} oleh ${buku.penulisBuku}');
      }
    }
  }

  // Closure
  Function tambahJumlah(int angkaTambah) {
    return (int jumlah) => jumlah + angkaTambah;
  }
}

// Parameter fungsi dan fungsi opsional
void ucapkanSalam(String nama, [String? pesanTambahan]) {
  if (pesanTambahan != null) {
    print('Halo, $nama! $pesanTambahan');
  } else {
    print('Halo, $nama!');
  }
}

// Fungsi dengan return value dan ekspresi singkat
int hitungTambah(int x, int y) => x + y;

void contohFungsiDiDalam() {
  int kaliDua(int a, int b) {
    return a * b;
  }

  int hasil = kaliDua(5, 6);
  print('Hasil kali dua: $hasil');
}

// Fungsi anonim dan scope
void contohFungsiAnonim() {
  var angka = [10, 20, 30, 40];

  angka.forEach((nomor) {
    print('Nomor: $nomor');
  });
}

void contohScope() {
  int variabelGlobal = 100;

  void fungsiDalam() {
    int variabelLokal = 200;
    print('Variabel Global: $variabelGlobal');
    print('Variabel Lokal: $variabelLokal');
  }

  fungsiDalam();
}
