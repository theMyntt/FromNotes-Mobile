import 'package:flutter/material.dart';
import 'package:fromnotes_mobile/pages/home/internal/about_page.dart';
import 'package:fromnotes_mobile/pages/home/internal/notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<Widget> screens = const [NotesPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Inicio'),
      ),
      body: PopScope(
        canPop: false,
        child: IndexedStack(
          index: index,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: 'Sobre')
        ],
      ),
    );
  }
}
