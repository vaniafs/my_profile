import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/controllers/form_controller.dart';
import 'package:my_profile/pages/pages1.dart';
import 'package:my_profile/pages/pages2.dart';

void main() {
  // Inisialisasi FormController
  Get.put(FormController());

  runApp(GetMaterialApp(
    initialRoute: '/page1', // Rute awal adalah Page1
    getPages: [
      GetPage(name: '/page1', page: () => Page1()),
      GetPage(name: '/page2', page: () => Page2()),
    ],
  ));
}
