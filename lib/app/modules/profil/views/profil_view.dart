import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan controller untuk mengakses dan menyimpan data profil
    final ProfilController _profilController = Get.find();

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Profil Pengguna'),
        actions: [
          IconButton(
            onPressed: () {
              // Tambahkan logika logout di sini
              // Misalnya, tampilkan dialog konfirmasi atau langsung lakukan logout
              // Contoh sederhana hanya menampilkan pesan ke konsol:
              print('Logout');
            },
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/PustakaDigital.png'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _profilController.nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  // Mengatur warna teks dan hint text agar terlihat di atas latar belakang putih
                  hintStyle: TextStyle(color: Colors.grey),
                  // Mengatur warna teks saat pengguna sedang memasukkan input
                  // dan saat teks tidak di fokus
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _profilController.bioController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  // Mengatur warna teks dan hint text agar terlihat di atas latar belakang putih
                  hintStyle: TextStyle(color: Colors.grey),
                  // Mengatur warna teks saat pengguna sedang memasukkan input
                  // dan saat teks tidak di fokus
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Menyimpan informasi profil saat tombol disentuh
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
