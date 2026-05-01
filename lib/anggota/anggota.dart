enum AnggotaRank { ketua, wakilKetua, kadiv, wakadiv, anggota }

class Anggota {
  final String nama;
  final String posisi;
  final String divisi;
  final AnggotaRank rank;
  final String? ig;
  final String? kontak;
  final String? foto;

  const Anggota({
    required this.nama,
    required this.posisi,
    required this.divisi,
    required this.rank,
    this.ig,
    this.kontak,
    this.foto,
  });

  //buat nandain tingkatan posisi jabatan
  String get bintang {
    switch (rank) {
      case AnggotaRank.ketua:
        return '⭐⭐⭐⭐⭐';
      case AnggotaRank.wakilKetua:
        return '⭐⭐⭐⭐';
      case AnggotaRank.kadiv:
        return '⭐⭐⭐';
      case AnggotaRank.wakadiv:
        return '⭐⭐';
      case AnggotaRank.anggota:
        return '⭐';
    }
  }

  String get rankLabel {
    switch (rank) {
      case AnggotaRank.ketua:
        return 'Boss Besar';
      case AnggotaRank.wakilKetua:
        return 'Wakil Boss';
      case AnggotaRank.kadiv:
        return 'Kepala Divisi';
      case AnggotaRank.wakadiv:
        return 'Wakil Kepala Divisi';
      case AnggotaRank.anggota:
        return 'Anggota';
    }
  }

  // urutin dari boss besar sampe ke krucil
  int get rankOrder {
    switch (rank) {
      case AnggotaRank.ketua:
        return 0;
      case AnggotaRank.wakilKetua:
        return 1;
      case AnggotaRank.kadiv:
        return 2;
      case AnggotaRank.wakadiv:
        return 3;
      case AnggotaRank.anggota:
        return 4;
    }
  }

  // Inisial nama untuk avatar
  String get inisial {
    final bagian = nama.trim().split(' ');
    if (bagian.length >= 2) {
      return '${bagian[0][0]}${bagian[1][0]}'.toUpperCase();
    }
    return bagian[0][0].toUpperCase();
  }
}
