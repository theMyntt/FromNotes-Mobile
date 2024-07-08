import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'lib/assets/images/logo.png',
            height: 150,
          ),
          const Text(
            'FromHel iSync',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const Text('Versão 0.0.1'),
          const SizedBox(
            height: 25,
          ),
          const Text('Desenvolvido por Gabriel Araújo e Matheus Abrantes.'),
        ],
      ),
    );
  }
}
