import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/modules/login/controller/login_controller.dart';
import 'package:zarnikyawtest/utils/colors.dart';
import 'package:zarnikyawtest/utils/components/card_view.dart';
import 'package:zarnikyawtest/utils/components/elevated_input_field.dart';
import 'package:zarnikyawtest/utils/components/elevated_password_field.dart';
import 'package:zarnikyawtest/utils/components/rounded_button.dart';
import 'package:zarnikyawtest/utils/components/sizebox_small.dart';
import 'package:zarnikyawtest/utils/dimens.dart';
import 'package:zarnikyawtest/utils/style.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller = Get.put(LoginController()); // inject controller
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: dPaddingNormal,
              right: dPaddingNormal,
              top: dPaddingDefault),
          child: Column(
            children: [
              CardView(
                borderRadius: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    "assets/images/takehome_gradient_bg.png",
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizeBoxSmall(size: size),
              Padding(
                padding: const EdgeInsets.only(
                    right: dPaddingDefault, left: dPaddingDefault),
                child: buildLoginForm(size),
              ),
            ],
          ),
        ),
      );
    });
  }

  Form buildLoginForm(Size size) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            'Sign In',
            style: stLargeTitle(),
          ),
          SizeBoxSmall(size: size),
          ElevatedInputField(
            textEditingController: _controller.emailController,
            borderColor: kPrimaryDark,
            hint: 'Enter email',
            validation: _controller.emailValidation.value,
            errorText: 'Please enter email!',
          ),
          const SizedBox(height: dPaddingLarge),
          ElevatedPasswordField(
            textEditingController: _controller.passwordController,
            borderColor: kPrimaryDark,
            hint: 'Enter password',
            validation: _controller.passwordValidation.value,
            errorText: 'Please enter password!',
          ),
          const SizedBox(height: dPaddingXL),
          RoundedButton(
            width: size.width,
            text: 'Sign In'.tr,
            borderRadius: dBorderRadiusNormal,
            press: () => {
              if (formKey.currentState!.validate()) {
                _controller.login()}
            },
            color: kPrimaryDark,
            textColor: kPrimaryLightColor,
          ),
          SizeBoxSmall(size: size * 3),
          SizeBoxSmall(size: size),
        ],
      ),
    );
  }
}
