import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/controllers/form_controller.dart';

class Page2 extends StatelessWidget {
  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile Data')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileView(),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileView() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileItem(formController.username.value, Icons.account_circle),
            _buildProfileItem(formController.name.value, Icons.person),
            _buildProfileItem(formController.email.value, Icons.email),
            _buildProfileItem(formController.phone.value, Icons.phone),
            _buildProfileItem(formController.address.value, Icons.home),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String value, IconData iconData) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 24.0,
          ),
          SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
