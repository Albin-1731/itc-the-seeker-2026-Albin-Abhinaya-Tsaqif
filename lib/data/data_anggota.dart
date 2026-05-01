import '../anggota/anggota.dart';

//bisa di ubah deskripsinya
const itcNama = 'Information Technology Club';
const itcDeskripsi =
    'Komunitas mahasiswa yang berfokus pada pengembangan ilmu dan '
    'keterampilan di bidang teknologi informasi. ITC hadir sebagai '
    'ruang belajar, berkolaborasi, dan berinovasi bagi seluruh '
    'mahasiswa yang memiliki passion di dunia IT.';
const itcVisi =
    'Menjadi komunitas IT terpopuler di UPNVYK yang melahirkan inovator '
    'berdampak di era digital.';
const List<String> itcMisi = [
  'Memfasilitasi pengembangan skill teknis anggota.',
  'Membangun budaya kolaborasi dan open-source.',
  'Menghubungkan anggota dengan industri teknologi.',
];

//data dummy nya, nah disini buat ubah data jika ada kepengurusan baru.
//ga bakal rubah kode lain soalnya data kepisah dari file yang lain.
final List<Anggota> member = [
  // Boss nya
  Anggota(
      nama: 'Grace Rianty Butar Butar',
      posisi: 'BOSS BESARR',
      divisi: 'Leader',
      rank: AnggotaRank.ketua,
      kontak: '08123456789',
      ig: '@graceriantyy',
      foto: 'grace.jpeg'),
  Anggota(
      nama: 'Dzaki Ghatfaan Abhipraya',
      posisi: 'Wakil Boss',
      divisi: 'Leader',
      rank: AnggotaRank.wakilKetua,
      kontak: '08975882422',
      ig: '@xaki_to',
      foto: 'dzaki.jpeg'),

  // Komandan divisi
  Anggota(
      nama: 'Bintoro',
      posisi: 'Kadiv Mobile Development',
      divisi: 'Mobile Development',
      rank: AnggotaRank.kadiv,
      kontak: '087831544359',
      ig: '@_linkebin',
      foto: 'bintoro.jpeg'),
  Anggota(
      nama: 'Ikhsan Fillah Hidayat',
      posisi: 'Wakadiv Mobile Development',
      divisi: 'Mobile Development',
      rank: AnggotaRank.wakadiv,
      kontak: '08345678901',
      ig: '@ikhsannflh',
      foto: 'ikhsan.jpeg'),

  // Anggota
  Anggota(
      nama: 'Albin Abhinaya Tsaqif',
      posisi: 'Anggota Mobile Development',
      divisi: 'Mobile Development',
      rank: AnggotaRank.anggota,
      kontak: '08895082532',
      ig: '@alllb1nnz._',
      foto: 'albin.jpeg'),
];

// urutin
List<Anggota> get urutinMember {
  final urutin = List<Anggota>.from(member);
  urutin.sort((a, b) => a.rankOrder.compareTo(b.rankOrder));
  return urutin;
}

Anggota get chairman => member.firstWhere((m) => m.rank == AnggotaRank.ketua);

int get totalDivisions => member.map((m) => m.divisi).toSet().length;
