import 'package:classico/firebase_options.dart';
import 'package:classico/src/features/authentication/controllers/signup_controller.dart';
import 'package:classico/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:classico/src/repository/authntication/exception/auth_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  // Get.put(SignupController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primaryColor: Colors.blue, // Customize your theme colors here
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(fontFamily: 'Roboto', fontSize: 16),
              headline6: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              // Add more custom text styles if needed
            ),
      ),
      home: WelcomeScreen(),
      // Implement routes if you have multiple screens
      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => WelcomeScreen()),
      //   // Add more routes here
      // ],
    );
  }
}
