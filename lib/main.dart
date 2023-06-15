import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Navigation Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Drawer Header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                // Implementasikan aksi yang ingin dilakukan saat item-menu "Home" diklik
                setState(() {
                  _selectedIndex = 0; // Memberikan nilai 0 pada _selectedIndex
                });
                Navigator.pop(
                    context); // Menutup drawer setelah item-menu diklik
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Implementasikan aksi yang ingin dilakukan saat item-menu "Logout" diklik
                setState(() {
                  _selectedIndex = 1; // Memberikan nilai 1 pada _selectedIndex
                });
                Navigator.pop(
                    context); // Menutup drawer setelah item-menu diklik
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Selected Index: $_selectedIndex',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
