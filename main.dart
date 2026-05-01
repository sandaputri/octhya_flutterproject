import 'package:flutter/material.dart';
import 'package:project1/page/beranda_page.dart';
import 'package:project1/page/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;

  // Variabel Penampung Data Profil
  String nama = "Jhon Doe";
  String lokasi = "Jakarta, Indonesia";
  String profesi = "Flutter Software Engineer";
  String email = "example@mail.com";
  String hp = "08123456789";

  // Fungsi untuk mengupdate data dari Beranda
  void updateData(String n, String l, String p, String e, String h) {
    setState(() {
      nama = n;
      lokasi = l;
      profesi = p;
      email = e;
      hp = h;
      currentPage = 1; // Otomatis pindah ke tab Profil setelah simpan
    });
  }

  @override
  Widget build(BuildContext context) {
    // List halaman yang menerima data terbaru
    List<Widget> _pages = [
      BerandaPage(onSubmit: updateData),
      ProfilePage(
        nama: nama,
        lokasi: lokasi,
        profesi: profesi,
        email: email,
        hp: hp,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _pages[currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Beranda"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}