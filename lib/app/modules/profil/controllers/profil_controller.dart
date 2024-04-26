import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  // Controller untuk menyimpan nama
  TextEditingController nameController = TextEditingController();

  // Controller untuk menyimpan bio
  TextEditingController bioController = TextEditingController();

  // Metode untuk menyimpan profil
  void saveProfile() {
    // Simpan nama dan bio ke penyimpanan (misalnya database)
    String name = nameController.text;
    String bio = bioController.text;

    // Di sini Anda dapat menambahkan logika untuk menyimpan data ke penyimpanan permanen,
    // misalnya penyimpanan lokal (SharedPreferences) atau database online (Firestore).
    // Contoh sederhana hanya menampilkan pesan ke konsol:
    print('Nama: $name, Bio: $bio disimpan.');
  }

  @override
  void dispose() {
    // Pastikan untuk membuang controller saat tidak digunakan lagi
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }
}
