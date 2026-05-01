import 'package:flutter/material.dart';
import '../anggota/anggota.dart';
import '../tema/tema_app.dart';
import '../widget/karakter_anggota.dart';

class DetailScreen extends StatefulWidget {
  final Anggota member;
  const DetailScreen({super.key, required this.member});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;
  Anggota get m => widget.member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengurus'),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.star : Icons.star_border,
              color: _isFavorite ? TemaApp.gold : Colors.white,
            ),
            tooltip: _isFavorite ? 'Hapus Favorit' : 'Tambah Favorit',
            onPressed: () {
              setState(() => _isFavorite = !_isFavorite);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(_isFavorite
                    ? '${m.nama} ditambahkan ke favorit!'
                    : '${m.nama} dihapus dari favorit.'),
                duration: const Duration(seconds: 1),
                backgroundColor: TemaApp.primary,
              ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // awal
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [TemaApp.primary, TemaApp.accent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  // Avatar besar (foto atau inisial)
                  MemberAvatar(member: m, radius: 52),
                  const SizedBox(height: 14),
                  Text(m.nama,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 6),
                  Text(m.bintang, style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.5), width: 1),
                    ),
                    child: Text(m.rankLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        )),
                  ),
                ],
              ),
            ),

            // Info kartu
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _InfoCard(
                      icon: Icons.badge, title: 'Jabatan', value: m.posisi),
                  const SizedBox(height: 12),
                  _InfoCard(
                      icon: Icons.dashboard, title: 'Divisi', value: m.divisi),
                  const SizedBox(height: 12),
                  if (m.kontak != null) ...[
                    const SizedBox(height: 12),
                    _InfoCard(
                        icon: Icons.phone,
                        title: 'Kontak',
                        value: m.kontak!,
                        valueColor: TemaApp.accent),
                  ],
                  const SizedBox(height: 24),

                  // Tombol WhatsApp
                  if (m.kontak != null)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF25D366),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: const Icon(Icons.chat),
                        label: const Text(
                          'Hubungi via WhatsApp',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          // Tambahkan url_launcher di pubspec.yaml
                          // untuk membuka WhatsApp sungguhan:
                          // launchUrl(Uri.parse('https://wa.me/${m.contact}'));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Menghubungi ${m.nama}...'),
                            backgroundColor: TemaApp.primary,
                          ));
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: TemaApp.accent, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(value,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: valueColor ?? Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
