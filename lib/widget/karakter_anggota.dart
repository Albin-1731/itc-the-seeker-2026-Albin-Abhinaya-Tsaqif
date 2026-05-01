import 'package:flutter/material.dart';
import '../anggota/anggota.dart';
import '../tema/tema_app.dart';

class MemberAvatar extends StatelessWidget {
  final Anggota member;
  final double radius;

  const MemberAvatar({
    super.key,
    required this.member,
    this.radius = 28,
  });

  @override
  Widget build(BuildContext context) {
    if (member.foto != null && member.foto!.isNotEmpty) {
      // nampilin foto dari asset
      return CircleAvatar(
        radius: radius,
        backgroundColor: TemaApp.primary,
        child: ClipOval(
          child: Image.asset(
            member.foto!,
            width: radius * 2,
            height: radius * 2,
            fit: BoxFit.cover,
            // Kalau foto gagal dimuat, fallback ke inisial
            errorBuilder: (_, __, ___) => _InitialsAvatar(
              initials: member.inisial,
              radius: radius,
            ),
          ),
        ),
      );
    }

    // ── Fallback: tampilkan inisial ──────────────────────────────
    return _InitialsAvatar(initials: member.inisial, radius: radius);
  }
}

class _InitialsAvatar extends StatelessWidget {
  final String initials;
  final double radius;

  const _InitialsAvatar({required this.initials, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: TemaApp.primary,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.65,
        ),
      ),
    );
  }
}
