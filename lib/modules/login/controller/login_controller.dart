import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/routes/app_pages.dart';
import 'package:zarnikyawtest/utils/extension.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final String spaceId = "1";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var emailValidation = true.obs;
  var passwordValidation = true.obs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> onInit() async {
    emailController.addListener(() {
      emailValidation.value =
          !GetUtils.isEmail(emailController.text.filterNull());
    });
    passwordController.addListener(() {
      passwordValidation.value = passwordController.text.isEmpty;
    });
    super.onInit();
  }

  void login() async {
    isLoading(true);
    var email = emailController.text;
    var password = passwordController.text;
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      if (authResult.user != null) {
        navigateToDashboard();
      } else {
        showSnackBar("No user data found!");
      }
    } on FirebaseAuthException catch (e) {
      var message = e.message ?? "auth error";
      showSnackBar(message);
    }
    isLoading(false);
  }

  void showSnackBar(String message) {
    Get.snackbar(
      "Error signing in",
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToDashboard() {
    Get.offNamed(Routes.DASHBOARD);
  }
}
