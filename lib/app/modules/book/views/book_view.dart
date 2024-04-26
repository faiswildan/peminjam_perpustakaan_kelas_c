import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/book/views/detailbuku.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';
import '../../../data/model/response_buku.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Buku',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0), // Menambahkan padding di bagian bawah
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Cari berdasarkan judul buku...',
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            // Saat nilai TextField berubah, panggil filterBooks dengan nilai yang baru
                            if (value.isEmpty) {
                              // Jika nilai TextField kosong, panggil filterBooks dengan nilai kosong
                              controller.filterBooks('');
                            } else {
                              // Jika nilai TextField tidak kosong, panggil filterBooks dengan nilai yang diinput
                              controller.filterBooks(value);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: controller.obx(
                      (state) => ListView.separated(
                    itemCount: state!.length,
                    itemBuilder: (context, index) {
                      DataBuku dataBuku = state[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Container(
                                  child: Image.asset(
                                    "${dataBuku.image}",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${dataBuku.judul}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Penulis ${dataBuku.penulis}\n${dataBuku.penerbit}-${dataBuku.tahunTerbit}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {
                            //     controller.addKoleksi(context, index);
                            //   },
                            //   icon: Icon(Icons.add),
                            //   tooltip: 'Tambahkan Ke Koleksi',
                            // ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetail(
                                      title: "${dataBuku.judul}",
                                      description: "${dataBuku.deskripsi}",
                                      image: "${dataBuku.image}",
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.info),
                              tooltip: 'Detail Buku',
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(
                                  Routes.ADD_PEMINJAMAN,
                                  parameters: {
                                    'id': (dataBuku.id ?? 0).toString(),
                                    'judul': dataBuku.judul ?? '_',
                                    'image': dataBuku.image ?? '',
                                  },
                                );
                              },
                              icon: Icon(Icons.library_books),
                              tooltip: 'Pinjam Buku',
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                  ),
                  onLoading: Center(child: CupertinoActivityIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
