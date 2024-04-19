import 'package:flutter/material.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/book/views/ulasan_view.dart';

class BookPage extends StatelessWidget {
  final String judul;
  final String ebook;

  BookPage({
    required this.judul,
    required this.ebook,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halaman Ebook'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: Container(
                width: 900,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$judul',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$ebook',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman ulasan
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReviewPage(judul: judul)),
                        );
                      },
                      child: Text('Beri Ulasan', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
