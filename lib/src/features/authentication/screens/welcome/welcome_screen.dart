import 'package:classico/src/constants/colors.dart';
import 'package:classico/src/constants/sizes.dart';
import 'package:classico/src/constants/text_strings.dart';
import 'package:classico/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/image_strings.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(tWelcomeScreenImage),
            height: height * 0.6,
          ),
          Column(
            children: [
              Text(
                tWelocmeText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                tWelocmeSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () => {
                            print("Login button pressed!!"),
                            Get.to(() => const LoginScreen()),
                          },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: tSecondaryColor,
                        side: BorderSide(color: tSecondaryColor),
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                      child: Text(tLogin.toUpperCase()))),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        print("signup page");
                        Get.to(() => const SignUp());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: tWhiteColor,
                        backgroundColor: tSecondaryColor,
                        side: BorderSide(color: tSecondaryColor),
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                      child: Text(tSignup.toUpperCase())))
            ],
          )
        ],
      ),
    ));
  }
}
