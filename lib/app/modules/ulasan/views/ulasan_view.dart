import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ulasan_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UlasanView extends StatelessWidget {
  final UlasanController controller = Get.put(UlasanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulasan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/PustakaDigital.png',
                height: 200,
                width: 150,
              ),
            ),
            SizedBox(height: 8),
            Text('Berikan rating:'),
            Obx(() => RatingBar(
              onRatingChanged: (rating) => controller.rating.value = rating,
            )),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Tulis ulasan Anda...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => controller.review.value = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.submitReview(),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final Function(double) onRatingChanged;

  RatingBar({required this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.star),
      onPressed: () {
        // Simulasi rating dari 1 sampai 5
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Berikan rating'),
            content: RatingSlider(onRatingChanged: onRatingChanged),
          ),
        );
      },
    );
  }
}

class RatingSlider extends StatefulWidget {
  final Function(double) onRatingChanged;

  RatingSlider({required this.onRatingChanged});

  @override
  _RatingSliderState createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _rating,
      min: 1,
      max: 5,
      divisions: 4,
      label: _rating.toString(),
      onChanged: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      onChangeEnd: (rating) {
        widget.onRatingChanged(rating);
        Navigator.pop(context);
      },
    );
  }
}
