import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_buku.dart';
import '../../../data/provider/api_provider.dart';
import 'package:dio/dio.dart'as dio;

import '../../../data/provider/storage_provider.dart';

class BookController extends GetxController with StateMixin<List<DataBuku>> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final count = 0.obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Fungsi untuk mengambil data buku dari server
  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final ResponseBuku responseBuku =
        ResponseBuku.fromJson(response.data);
        if (responseBuku.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBuku.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addKoleksi(context, index) async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //nge close keyboard
      DataBuku dataBuku = state![index];
      final idUser = StorageProvider.read(StorageKey.idUser);
      final bookId = Get.parameters['id'];
      final response = await ApiProvider.instance().post(Endpoint.koleksi,
          data: {
            "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
            "book_id": dataBuku.id,
          });
      if (response.statusCode == 201) {
        Get.back();
        Get.snackbar("Berhasil", "Buku berhasil disimpan ke dalam koleksi", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Sorry", "Menambahkan Ke Koleksi Gagal", backgroundColor: Colors.orange);
      }
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Sorry", e.toString(), backgroundColor: Colors.red);
    }
  }

  void filterBooks(String query) {
    // Lakukan filter berdasarkan judul buku
    if (query.isNotEmpty) {
      List<DataBuku> filteredList = state!
          .where((book) => book.judul!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      change(filteredList, status: RxStatus.success());
    } else {
      // Jika query kosong, tampilkan semua buku
      change(state, status: RxStatus.success());
    }
  }

  void increment() => count.value++;
}
