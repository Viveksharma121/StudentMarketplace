import 'package:classico/src/constants/image_strings.dart';
import 'package:classico/src/constants/sizes.dart';
import 'package:classico/src/constants/text_strings.dart';
import 'package:classico/src/features/authentication/screens/forgotpass/Forgot_pass.dart';
import 'package:classico/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:classico/src/features/authentication/screens/forgotpass/Forgot_pass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";

  final _formKey = GlobalKey<FormState>();

  TextEditingController useremailController = new TextEditingController();
  TextEditingController userpasswordController = new TextEditingController();

  loginFunc() async {
    if (email != null && password != null) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Login succesfull",
            style: TextStyle(fontSize: 20.0),
          ),
        ));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));

        print("log in succesfull");
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Login Failed"),
                content: Text("Incorrect email or password. Please try again."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK")),
                ],
              );
            });
        print("couldnt log in ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(tLoginGif),
                height: size.height * 0.2,
              ),
              Text(
                tLogin,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 50, // Set your desired font size
                      fontWeight:
                          FontWeight.bold, // Set your desired font weight
                    ),
              ),
              Text(
                tLoginintext,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              /* sectioon 2*/
              Form(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: tFormHeigh - 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: useremailController,
                              validator: (Value) {
                                if (Value == null || Value.isEmpty) {
                                  return "Please enter email";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person_outline_outlined),
                                  labelText: tEmail,
                                  hintText: tEmail,
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: tFormHeigh - 20,
                            ),
                            TextFormField(
                              controller: userpasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.fingerprint),
                                  labelText: tPass,
                                  hintText: tPass,
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.remove_red_eye_sharp),
                                  )),
                            ),
                            const SizedBox(
                              height: tFormHeigh - 20,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Forgot_pass()));
                                },
                                child: const Text("Forgot password?"),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        email = useremailController.text;
                                        password = userpasswordController.text;
                                      });
                                      loginFunc();
                                    }
                                  },
                                  child: Text(tLogin.toUpperCase())),
                            )
                          ]))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Or"),
                  const SizedBox(
                    height: tFormHeigh - 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          padding: EdgeInsets.symmetric(
                              vertical: tFormHeigh - 20.0,
                              horizontal: tFormHeigh - 10.0),
                        ),
                        icon: Image(
                          image: AssetImage(
                            tGooglelogoimage,
                          ),
                          width: 20.0,
                        ),
                        label: Padding(
                            padding: EdgeInsets.only(left: tFormHeigh - 20.0),
                            child: Text("Sign-in with Google")),
                      )),
                  const SizedBox(
                    width: tFormHeigh - 20.0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text.rich(TextSpan(
                          text: "Don't have an Account? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: const [
                            TextSpan(
                                text: tSignup,
                                style: TextStyle(color: Colors.blue))
                          ])))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
