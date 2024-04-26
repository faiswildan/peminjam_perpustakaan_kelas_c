import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/koleksi/views/penulis.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/koleksi/views/ebook_view.dart';
import '../controllers/koleksi_controller.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/book/views/detailbuku.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Koleksi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: controller.obx(
            (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (ctx, index) {
            var book = state[index].book;
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    book?.image ?? '', // Path gambar dari model data
                    height: 120,
                  ),
                ),
                title: Text(
                  book?.judul ?? '', // Judul buku dari model data
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetail(
                              title: "${book?.judul}",
                              description: "${book?.deskripsi}",
                              image: "${book?.image}",
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.info),
                      tooltip: 'Detail Buku',
                    ),
                    IconButton(
                      icon: Icon(Icons.book),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookPage(
                              judul: "${book?.judul}",
                              ebook: "${book?.ebook}",
                            ),
                          ),
                        );
                      },
                      tooltip: 'Baca Ebook',
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     Get.toNamed(
                    //       Routes.ADD_PEMINJAMAN,
                    //       parameters: {
                    //         'id': (book?.id ?? 0).toString(),
                    //         'judul': book?.judul ?? '_',
                    //         'image' : book?.image ?? '',
                    //       },
                    //     );
                    //   },
                    //   icon: Icon(Icons.library_books), // Anda bisa mengganti ikon ini dengan ikon yang Anda inginkan
                    //   tooltip: 'Pinjam Buku', // Tambahkan tooltip untuk memberi tahu pengguna apa yang akan dilakukan tombol
                    // ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthorInfoPage(
                              author: "${book?.penulis}",
                              image: "${book?.image}",
                              biografi: "${book?.biografi}",
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.create),
                      tooltip: 'Penulis',
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(); // Divider antara setiap item
          },
        ),
      ),
    );
  }
}
