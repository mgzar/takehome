import 'package:get/get.dart';
import 'package:zarnikyawtest/model/firebaseUser.dart';

class UserController extends GetxController{

  final Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }

}