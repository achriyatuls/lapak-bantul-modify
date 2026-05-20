import 'package:flutter/material.dart';
import 'home_page.dart';
import 'screens/tax/pbb_page.dart';
import 'screens/tax/pajak_kendaraan_page.dart';
import 'screens/tax/pajak_usaha_page.dart';
import 'screens/tax/layanan_keliling_page.dart';
import 'screens/users/users_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[
    HomePage(),
    PbbPage(),
    PajakKendaraanPage(),
    PajakUsahaPage(),
    LayananKelilingPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF003566),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape_outlined),
            activeIcon: Icon(Icons.landscape),
            label: 'PBB',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_outlined),
            activeIcon: Icon(Icons.directions_car),
            label: 'Kendaraan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            activeIcon: Icon(Icons.store),
            label: 'Usaha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: 'Keliling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_outlined),
            activeIcon: Icon(Icons.cloud),
            label: 'API Demo',
          ),
        ],
      ),
    );
  }
}
