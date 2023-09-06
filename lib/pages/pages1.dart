import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/controllers/form_controller.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final FormController formController = Get.find();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Page')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInputField('Username', formController.username, TextInputType.text),
          _buildInputField('Nama', formController.name, TextInputType.text),
          _buildEmailInputField(),
          _buildInputField('Nomor Telepon', formController.phone, TextInputType.phone),
          _buildInputField('Alamat', formController.address, TextInputType.text),
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          isLoading
              ? CircularProgressIndicator()
              : _buildRegisterButton(),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, RxString controller, TextInputType keyboardType) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: TextEditingController(text: controller.value),
        onChanged: (value) => controller.value = value,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInputField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: TextEditingController(text: formController.email.value),
        onChanged: (value) => formController.email.value = value,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (value) {
          if (!value!.contains('@')) {
            return 'Format email tidak valid';
          }
          return null;
        },
      ),
    );
  }

Widget _buildRegisterButton() {
  return Container(
    width: 140, // Lebar tombol
    height: 40, // Tinggi tombol
    child: ElevatedButton(
      onPressed: () {
        _handleRegister();
      },
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), 
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    ),
  );
}


  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      if (_validateForm()) {
        setState(() {
          isLoading = true;
        });

        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            isLoading = false;
          });
          Get.toNamed('/page2');
        });
      } else {
        Get.snackbar('Error', 'Harap isi semua data');
      }
    }
  }

  bool _validateForm() {
    return formController.username.isNotEmpty &&
        formController.name.isNotEmpty &&
        formController.email.isNotEmpty &&
        formController.phone.isNotEmpty &&
        formController.address.isNotEmpty;
  }
}
