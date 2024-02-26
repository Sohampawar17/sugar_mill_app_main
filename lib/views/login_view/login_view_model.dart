import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool obscurePassword = true;
  bool isloading = false;
  initialise() {}

  void loginwithUsernamePassword(BuildContext context) async {
    isloading = true;
    notifyListeners();
    String username = usernameController.text;
    String password = passwordController.text;
    Logger().i(username);
    Logger().i(password);
    bool res = await Authentication().login(username, password);
    isloading = false;
    notifyListeners();
    if (res) {
      // if (true) {
      if (context.mounted) {
        Navigator.popAndPushNamed(context, Routes.homePageScreen);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Invalid Credentials",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  String? validateUsername(username) {
    if (username.toString().isEmpty) {
      return "Enter a valid username";
    }
    return null;
  }

  String? validatePassword(password) {
    if (password.toString().isEmpty) {
      return "Enter a Password";
    }
    return null;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
