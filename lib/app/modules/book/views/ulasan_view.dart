import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String judul;

  ReviewPage({required this.judul});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _rating = 0;
  String _ulasan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Review ${widget.judul}'),
      ),
      body: Center( // Menggunakan Center untuk konten rata tengah
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/PustakaDigital.png'),
                    )
                ),
              ),
              Text(
                'Beri Rating Buku ${widget.judul}:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Menggunakan MainAxisAlignment.center untuk rata tengah secara horizontal
                children: [
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      _rating >= 1 ? Icons.star : Icons.star_border,
                      color: _rating >= 1 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 1;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      _rating >= 2 ? Icons.star : Icons.star_border,
                      color: _rating >= 2 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 2;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      _rating >= 3 ? Icons.star : Icons.star_border,
                      color: _rating >= 3 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 3;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      _rating >= 4 ? Icons.star : Icons.star_border,
                      color: _rating >= 4 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 4;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      _rating >= 5 ? Icons.star : Icons.star_border,
                      color: _rating >= 5 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 5;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: TextField(
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      _ulasan = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Tulis ulasan Anda di sini',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _rating == 0.0 ? null : _simpanUlasan,
                child: Text('Simpan Ulasan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _simpanUlasan() {
    // Simpan ulasan dan rating ke dalam database
    print('Ulasan: $_ulasan');
    print('Rating: $_rating');
    // Anda dapat menambahkan logika penyimpanan ke dalam database di sini
  }
}
