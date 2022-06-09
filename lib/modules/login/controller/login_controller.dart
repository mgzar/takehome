import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/model/firebaseUser.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rx<User>? _firebaseUser;

  User get user => _firebaseUser!.value;

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: doc);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(_firebaseAuth.currentUser) as Rx<User>?;
  }

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
