import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/view/profile.dart';
import 'package:projectpraktpm_156_187/view/beranda.dart';
import 'package:projectpraktpm_156_187/view/favorite.dart'; // Import halaman Favorite

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar widget untuk halaman yang berbeda
  static const List<Widget> _listMenu = <Widget>[
    Beranda(),
    FavoritePage(), // Tambahkan halaman Favorite di sini
    ProfilePage(),
  ];

  // Metode untuk menangani penekanan item di bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/DrinkTale.jpg"), // Ubah path sesuai dengan lokasi gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: _listMenu.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',  // Label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icon Favorite
            label: 'Favorite',  // Label Favorite
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',  // Label
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange[300],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
