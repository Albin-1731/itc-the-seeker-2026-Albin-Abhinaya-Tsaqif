import 'package:flutter/material.dart';
import '../data/data_anggota.dart';
import '../tema/tema_app.dart';
import '../widget/karakter_anggota.dart';
import 'struktur_layar.dart';

class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    final boss = chairman;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TAHTA ITC',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //dashbor
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [TemaApp.primary, TemaApp.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itcNama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    itcDeskripsi,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Visi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: TemaApp.primary.withOpacity(0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TemaApp.primary.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('🎯  Visi',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TemaApp.primary,
                          fontSize: 14)),
                  const SizedBox(height: 6),
                  Text(itcVisi,
                      style: const TextStyle(fontSize: 13, height: 1.5)),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Misi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: TemaApp.accent.withOpacity(0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TemaApp.accent.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('📌  Misi',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TemaApp.accent,
                          fontSize: 14)),
                  const SizedBox(height: 8),
                  for (int i = 0; i < itcMisi.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${i + 1}. ',
                              style: const TextStyle(
                                  color: TemaApp.accent,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Text(itcMisi[i],
                                style:
                                    const TextStyle(fontSize: 13, height: 1.4)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Stats
            Row(
              children: [
                _StatCard(
                  icon: Icons.people,
                  label: 'Total Pengurus',
                  value: '${member.length}',
                ),
                const SizedBox(width: 12),
                _StatCard(
                  icon: Icons.dashboard,
                  label: 'Divisi',
                  value: '$totalDivisions',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // gambaran boss
            const Text(
              'Tahta Tertinggi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TemaApp.primary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Foto boss besar
                  MemberAvatar(member: boss, radius: 38),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                boss.nama,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(boss.bintang),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${boss.posisi} — ${boss.rankLabel}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                        if (boss.kontak != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  size: 14, color: TemaApp.accent),
                              const SizedBox(width: 4),
                              Text(
                                boss.kontak!,
                                style: const TextStyle(
                                    fontSize: 13, color: TemaApp.accent),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //Keterangan Bintang
            const Text(
              'Jabatan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: TemaApp.primary,
              ),
            ),
            const SizedBox(height: 11),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    _RankRow(
                        stars: '⭐⭐⭐',
                        label: 'Ketua / Wakil Ketua',
                        sub: 'Boss Besar'),
                    Divider(height: 20),
                    _RankRow(
                        stars: '⭐⭐',
                        label: 'Kepala Divisi',
                        sub: 'Kadiv dan Wakadiv'),
                    Divider(height: 20),
                    _RankRow(stars: '⭐', label: 'Anggota', sub: 'Member'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StrukturLayar()),
                );
              },
             style: ElevatedButton.styleFrom(
                  backgroundColor: TemaApp.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                        ),
              child: const Text('Lihat Struktur'),
              
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _StatCard(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: TemaApp.accent, size: 28),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: TemaApp.primary)),
                Text(label,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RankRow extends StatelessWidget {
  final String stars;
  final String label;
  final String sub;
  const _RankRow({required this.stars, required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(stars, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            Text(sub, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
