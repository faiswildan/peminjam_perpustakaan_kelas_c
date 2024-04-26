import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/koleksi/controllers/koleksi_controller.dart';

import 'package:peminjam_perpustakaan_kelasc/app/modules/koleksi/views/koleksi_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/peminjaman/views/peminjaman_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(KoleksiController());
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Halaman Utama',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // leading: IconButton( // Tambahkan leading parameter di sini
        //   icon: Icon(Icons.person),
        //   onPressed: () {
        //     Get.toNamed(Routes.PROFIL);
        //   },
        // ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: CarouselSlider(
              items: [
                // Daftar gambar buku populer
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/caraousel.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/rakbuku.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bukudirumput.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Tambahkan lebih banyak gambar buku populer di sini
              ],
              options: CarouselOptions(
                height: 450.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.BOOK),
                child: Text("Buku"),
              ),
              ElevatedButton(
                 onPressed: () => Get.toNamed(Routes.KOLEKSI),
                child: Text("Koleksi"),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                child: Text("Peminjaman"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

