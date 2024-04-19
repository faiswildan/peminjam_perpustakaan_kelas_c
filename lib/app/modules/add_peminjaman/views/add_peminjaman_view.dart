import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart'; // untuk format tanggal
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mm"); // format tanggal yang diinginkan

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Pinjam Buku'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  width: 200, // Sesuaikan lebar sesuai desain Anda
                  height: 200, // Sesuaikan tinggi sesuai desain Anda
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/PustakaDigital.png'), // Sesuaikan path gambar
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // DateTimePicker untuk Tanggal Pinjam
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DateTimeField(
                    format: format,
                    controller: controller.tglPinjamController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Tanggal Pinjam",
                      border: InputBorder.none,
                    ),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime:
                          TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Tanggal pinjam tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 8),
                // DateTimePicker untuk Tanggal Kembali
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DateTimeField(
                    format: format,
                    controller: controller.tglKembaliController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Tanggal Kembali",
                      border: InputBorder.none,
                    ),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime:
                          TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Tanggal kembali tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Obx(
                      () => controller.loading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () => controller.post(),
                    child: const Text("Pinjam"),
                  ),
                ).paddingOnly(top: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
