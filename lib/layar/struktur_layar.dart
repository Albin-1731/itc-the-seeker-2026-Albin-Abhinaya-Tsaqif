import 'package:flutter/material.dart';
import '../data/data_anggota.dart';
import '../anggota/anggota.dart';
import '../layar/detail_layar.dart';
import '../tema/tema_app.dart';
import '../widget/kartu_anggota.dart';

class StrukturLayar extends StatelessWidget {
  const StrukturLayar({super.key});

  // ngelempokin anggota dari rank
  Map<String, List<Anggota>> _grouped() {
    final map = <String, List<Anggota>>{};
    for (final m in urutinMember) {
      final key = m.rankLabel;
      map.putIfAbsent(key, () => []).add(m);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final groups = _grouped();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kepengurusan'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 24),
        children: [
          for (final entry in groups.entries) ...[
            //  awal atas grup
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12, bottom: 4),
              child: Text(
                entry.key.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: TemaApp.accent,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            // Kartu anggota
            for (final member in entry.value)
              MemberCard(
                member: member,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(member: member),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
