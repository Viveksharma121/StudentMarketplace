import 'package:classico/src/constants/colors.dart';
import 'package:classico/src/constants/sizes.dart';
import 'package:classico/src/constants/text_strings.dart';
import 'package:classico/src/features/authentication/screens/HomePage/homepage.dart';
// import 'package:classico/src/features/authentication/screens/HomePage/homepage.dart';
import 'package:classico/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/image_strings.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
        // backgroundColor: Colors.white,
        body: Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(height * 0.1 / 2),
            child: Image(
              image: AssetImage(tWelcomeScreenImage),
              height: height * 0.6,
            ),
          ),
          Column(
            children: [
              Text(
                tWelocmeText,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                tWelocmeSubTitle,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey[630], fontWeight: FontWeight.bold),
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
                            Get.to(() => const HomePage()),
                          },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
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
