import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
            'Peminjaman',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: SizedBox(
                    child: Image.asset(
                      "${state[index].book?.image}",
                    ),
                  ),
                ),
                title: Text("${state[index].book?.judul}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal Pinjam: ${state[index].tanggalPinjam}"),
                    Text("Tanggal Kembali: ${state[index].tanggalKembali}")
                  ],
                ),
                trailing: Text("${state[index].status}"),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(); // Divider between items
          },
        )
      )
    );
  }
}