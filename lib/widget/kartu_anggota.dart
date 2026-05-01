import 'package:flutter/material.dart';
import '../anggota/anggota.dart';
import '../tema/tema_app.dart';
import 'karakter_anggota.dart';

class MemberCard extends StatelessWidget {
  final Anggota member;
  final VoidCallback onTap;

  const MemberCard({super.key, required this.member, required this.onTap});

  Color get _badgeColor {
    switch (member.rank) {
      case AnggotaRank.ketua:
        return const Color(0xFFFFD700);
      case AnggotaRank.wakilKetua:
        return const Color(0xFFFFC107);
      case AnggotaRank.kadiv:
        return TemaApp.accent;
      case AnggotaRank.wakadiv:
        return TemaApp.accent;
      case AnggotaRank.anggota:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // foto atau inisial
              MemberAvatar(member: member, radius: 28),
              const SizedBox(width: 14),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            member.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(member.bintang,
                            style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      member.posisi,
                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _badgeColor.withOpacity(0.15),
                        border: Border.all(color: _badgeColor, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        member.rankLabel,
                        style: TextStyle(
                          color: _badgeColor == const Color(0xFFFFD700)
                              ? const Color(0xFF7A6000)
                              : _badgeColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
