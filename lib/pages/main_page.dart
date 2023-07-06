import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/pages/list_page.dart';
import 'package:socialapp/pages/quiz_page.dart';
import 'package:socialapp/pages/write_page.dart';
import 'package:socialapp/components/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const ListPage(),
    const WritePage(),
    const QuizPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      drawer: MyDrawer(
        img: currentUser.email.toString().split('@')[0],
      ),
      appBar: AppBar(
        title: Text(currentUser.email!),
        backgroundColor: Colors.pink[200],
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'post'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'quiz'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
