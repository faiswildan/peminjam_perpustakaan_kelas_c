import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                  controller: controller.usernameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Masukan Username",
                    border: OutlineInputBorder(),
                    filled: true, // Tambahkan properti filled
                    fillColor: Colors.white, // Warna latar belakang
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Masukan Password",
                    border: OutlineInputBorder(),
                    filled: true, // Tambahkan properti filled
                    fillColor: Colors.white, // Warna latar belakang
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
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
                    controller.login();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[500], // Warna tombol biru tua
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black, // Warna teks putih
                    ),
                  ),
                )),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[500], // Warna tombol biru tua
                  ),
                  child: Text(
                    "Daftar", // Teks tombol
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Warna teks hitam
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
