import 'package:flutter/material.dart';
import 'layar/layar_utama.dart';
import 'tema/tema_app.dart';

void main() {
  runApp(const ITCFamily());
}

class ITCFamily extends StatelessWidget {
  const ITCFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITC Family',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.theme,
      home: const LayarUtama(),
    );
  }
}
