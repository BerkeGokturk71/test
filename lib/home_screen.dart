import 'package:flutter/material.dart';
import 'package:tester/camasir.dart';
import 'package:tester/food__list.dart';
import 'google_auth.dart';
//ss
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: AnaEkran()),
    CamasirScreen(),
    Center(child: LoginPage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNotificationsPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildirimler'),
          content: Text('Henüz yeni bir bildirim yok!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar gölgesini kaldırmak için
        title: const Text(
          textAlign: TextAlign.start,
          'DormLife',
          style: TextStyle(
            fontSize: 25, // Daha büyük font boyutu
            fontWeight: FontWeight.w200, // Kalın yazı
            color: Colors.white,
            letterSpacing: 2, // Harf aralığı
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: _onNotificationsPressed,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _pages[_selectedIndex], // Seçilen ekranı gösterir
          ),
          // Alt Bar
          Container(
            height: 60,
            child: BottomNavigationBar(
              backgroundColor: Colors.white10,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant_menu), // Yemek ikonu
                  label: 'Yemekler',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event), // Etkinlikler ikonu
                  label: 'Etkinlikler',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person), // Hesap ikonu
                  label: 'Hesabım',
                ),
              ],
              currentIndex: _selectedIndex, // Seçili olan butonu belirler
              selectedItemColor: Colors.white, // Seçili olan butonun rengi
              unselectedItemColor:
                  Colors.white10, // Seçili olmayan butonların rengi
              onTap: _onItemTapped, // Butona tıklanınca çağrılır
              elevation: 0, // Alt barın gölgesini kaldırır
            ),
          ),
        ],
      ),
    );
  }
}
