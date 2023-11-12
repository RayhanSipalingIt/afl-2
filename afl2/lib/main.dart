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
    ProfileScreen(
      nama: '',
      pekerjaan: '',
      pengalaman: '',
      email: '',
      nomorTelepon: '',
    ), // Konten tab ketiga
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
            label: 'Temukan',
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
          'assets/images/download.jpeg',
          width: 100,
          height: 100,
        ),
        SizedBox(height: 180),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      nama: '',
                      pekerjaan: '',
                      pengalaman: '',
                      email: '',
                      nomorTelepon: '',
                    ),
                  ),
                );
              },
              child: Text('Portofolio'),
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
              child: Text('Input'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(100, 40)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // Inisialisasi controller untuk menerima input dari pengguna.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layar Input'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya.
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Memanggil fungsi buildTextFormField untuk membuat TextFormField dengan konfigurasi tertentu.
          buildTextFormField(_usernameController, 'Masukkan username Anda'),
          buildTextFormField(_jobController, 'Masukkan pekerjaan Anda'),
          buildTextFormField(_experienceController, 'Masukkan pengalaman Anda'),
          buildTextFormField(_emailController, 'Masukkan email Anda'),
          buildTextFormField(_phoneController, 'Masukkan nomor telepon Anda'),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    nama: _usernameController.text,
                    pekerjaan: _jobController.text,
                    pengalaman: _experienceController.text,
                    email: _emailController.text,
                    nomorTelepon: _phoneController.text,
                  ),
                ),
              );
            },
            child: Text('Ke Profil'),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField(
      TextEditingController controller, String labelText) {
    return Padding(
      // Padding digunakan untuk memberikan ruang antara widget TextFormField dengan tepi layar.
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        // Membuat TextFormField untuk input teks.
        controller:
            controller, // Menghubungkan TextFormField dengan controller yang sesuai.
        decoration: InputDecoration(
          // Konfigurasi tampilan luar TextFormField.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 5,
            ),
          ),
          labelText: labelText, // Label yang ditampilkan di atas TextFormField.
          labelStyle:
              TextStyle(fontSize: 18), // Konfigurasi gaya teks untuk label.
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  // Simpanan info tentang pengguna, seperti nama, pekerjaan, pengalaman, email, dan nomor telepon.
  final String _nama;
  final String _pekerjaan;
  final String _pengalaman;
  final String _email;
  final String _nomorTelepon;

  // Buat layar profil dengan mengirimkan informasi pengguna yang diterima melalui konstruktor.
  ProfileScreen({
    required String nama,
    required String pekerjaan,
    required String pengalaman,
    required String email,
    required String nomorTelepon,
  })  : _nama = nama,
        _pekerjaan = pekerjaan,
        _pengalaman = pengalaman,
        _email = email,
        _nomorTelepon = nomorTelepon;


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
            // Tampilkan gambar profil dengan CircleAvatar
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/download.jpeg'),
              radius: 50, // Sesuaikan ukuran radius sesuai keinginan
            ),
            SizedBox(height: 20), // Beri jarak antara gambar profil dan teks
            SizedBox(height: 20), // Beri jarak antara gambar profil dan teks
            Text(
              'Nama: $_nama',//menampilkan inputan dari discover screen
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Pekerjaan: $_pekerjaan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pengalaman: $_pengalaman',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email: $_email',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nomor Telepon: $_nomorTelepon',
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
