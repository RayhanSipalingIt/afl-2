import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget utama yang mengatur pengaturan tingkat atas untuk MaterialApp.
    return MaterialApp(
      home:
          MyBottomNavigationBar(), // Mengatur MyBottomNavigationBar sebagai layar utama.
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0; // Menyimpan indeks tab yang sedang dipilih.

  final List<Widget> _children = [
    HomeScreen(), // Konten tab pertama
    DiscoverScreen(), // Konten tab kedua
    ProfileScreen(), // Konten tab ketiga
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Navigasi Bawah'),
      ),
      body: _children[
          _currentIndex], // Menampilkan konten berdasarkan tab yang dipilih.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _currentIndex, // Mencerminkan tab yang sedang dipilih di bottom navigation bar.
        onTap: onTabTapped, // Callback ketika tab di-tap.
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Pendidikan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Memperbarui indeks tab yang dipilih.
    });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20),
        Image.asset(
          'assets/images/download.jpeg' ),
        SizedBox(height: 250),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: Text('Profile'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(100, 40)),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiscoverScreen()),
                );
              },
              child: Text('Pendidikan'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(110, 40)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Riwayat Pendidikan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('1. SD ABC (Tahun 2009-2015)'),
            Text('2. SMP XYZ (Tahun 2015-2018)'),
            Text('3. SMK 123 (Tahun 2018-2021)'),
            SizedBox(height: 16),
            Text(
              'Cita-cita:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Menjadi orang kaya raya'),
            SizedBox(height: 16),
            Text(
              'Hobi:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('1. Koding dan pengembangan aplikasi'),
            Text('2. Membaca buku dan artikel teknologi'),
            Text('3. Bermain musik'),
            Text('4. Traveling dan fotografi'),
            // Tambahkan bagian lainnya seperti keterampilan, pengalaman kerja, dll.
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String nama = 'Rayhan Akhafi';
  final String pekerjaan = 'Pekerjaan atau Bidang Anda';
  final String pengalaman = 'Beberapa tahun dalam pengembangan perangkat lunak';
  final String email = 'example@email.com'; // Ganti dengan email Anda
  final String nomorTelepon = '+62 123 4567 890'; // Ganti dengan nomor telepon Anda
  final String alamat = 'Alamat Anda'; // Ganti dengan alamat Anda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/download.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              nama,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              pekerjaan,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Skill: Flutter, Dart, Mobile App Development', // Ganti dengan skill Anda
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Pengalaman: $pengalaman',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Alamat: $alamat',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Email: $email',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nomor Telepon: $nomorTelepon',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}