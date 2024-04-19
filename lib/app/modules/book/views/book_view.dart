import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/book/views/detailbuku.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';
import '../../../data/model/response_buku.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('BookView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
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
                              child: Image.asset(
                                "${dataBuku.image}",
                                height: 100,
                                width: 20,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
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
                          IconButton(
                            onPressed: () {
                              controller.addKoleksi(context, index);
                            },
                            icon: Icon(Icons.add),
                            tooltip: 'Tambahkan Ke Koleksi',
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetail(
                                    title: "${dataBuku.judul}",
                                    description:
                                    "${dataBuku.deskripsi}",
                                    imageUrl:
                                    "${dataBuku.image}",
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
                                },
                              );
                            },
                            icon: Icon(Icons.library_books), // Anda bisa mengganti ikon ini dengan ikon yang Anda inginkan
                            tooltip: 'Pinjam Buku', // Tambahkan tooltip untuk memberi tahu pengguna apa yang akan dilakukan tombol
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
    );
  }
}
