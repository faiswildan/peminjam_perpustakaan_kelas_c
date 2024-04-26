import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/PustakaDigital.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller.namaController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller.usernameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Masukkan Username",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller.telpController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Masukkan No Telepon",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "No Telepon tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller.alamatController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Masukkan Alamat",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller.passwordController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[500], // Warna tombol biru tua
                    ),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the login page
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[500],
                    ),
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
