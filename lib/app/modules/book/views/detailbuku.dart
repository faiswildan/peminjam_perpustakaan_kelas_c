import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  BookDetail({required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // Set warna background halaman menjadi biru
        title: Text('Book Detail'),
      ),
      backgroundColor: Colors.lightBlue, // Set warna background halaman menjadi biru
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set warna teks menjadi putih
              ),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(5), // Mengatur sudut gambar
              child: Container(
                width: 100.0, // Sesuaikan lebar gambar sesuai kebutuhan
                child: Image.asset(
                  image,
                  fit: BoxFit.cover, // Untuk memastikan gambar terisi dengan benar dalam container
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Set warna background kontainer menjadi putih
                      borderRadius: BorderRadius.circular(10.0), // Atur sudut tumpul dengan radius 10.0
                      boxShadow: [ // Tambahkan bayangan untuk memberikan efek tumpul
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
