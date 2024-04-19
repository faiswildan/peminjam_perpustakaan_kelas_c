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
          title: const Text('PeminjamanView'),
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
                  borderRadius: BorderRadius.circular(8)
              ),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("${state[index].book?.image}"),
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
        ))
    );
  }
}