import 'package:get/get.dart';

class UlasanController extends GetxController {
  RxDouble rating = 3.0.obs;
  RxString review = ''.obs;

  void submitReview() {
    // Simulasi pengiriman ulasan ke server
    print('Rating: ${rating.value}');
    print('Ulasan: ${review.value}');
    // Reset nilai rating dan ulasan setelah pengiriman
    rating.value = 3.0;
    review.value = '';
    // Tambahkan logika pengiriman ulasan ke server sesuai kebutuhan
  }
}
