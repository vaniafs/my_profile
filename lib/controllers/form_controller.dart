import 'package:get/get.dart';

class FormController extends GetxController {
  // Properti untuk menyimpan data formulir
  var username = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var address = ''.obs;

  // Metode untuk melakukan validasi formulir
  bool validateForm() {
    return username.isNotEmpty &&
        name.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty;
  }
}
