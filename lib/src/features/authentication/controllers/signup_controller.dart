import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/authntication/exception/auth_repo.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneno = TextEditingController();

  Future<void> registerUser() async {
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      // Registration successful, you can navigate to the next screen or perform any other actions.
      print("Registration successful");
    } catch (e) {
      // Handle registration failure here.
      print("Registration failed: $e");
    }
  }
}
