import 'package:flutter/material.dart';

class AuthorInfoPage extends StatelessWidget {
  final String author;
  final String image;
  final String biografi;

  AuthorInfoPage({
    required this.author,
    required this.image,
    required this.biografi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Informasi Penulis'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 140.0, // Sesuaikan lebar gambar sesuai kebutuhan
              height: 200.0, // Sesuaikan tinggi gambar sesuai kebutuhan
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // Sesuaikan nilai border radius sesuai kebutuhan
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)
              ),// Set the background color to white
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Align text to the center
                children: <Widget>[
                  Text(
                    'Nama Penulis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, // Align text to the center
                  ),
                  Text(
                    '$author',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal), // Set to normal weight for regular text
                    textAlign: TextAlign.center, // Align text to the center
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Biografi Penulis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, // Align text to the center
                  ),
                  Text(
                    '$biografi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal), // Set to normal weight for regular text
                    textAlign: TextAlign.center, // Align text to the center
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}