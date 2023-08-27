import 'package:classico/src/constants/colors.dart';
import 'package:classico/src/constants/image_strings.dart';
import 'package:classico/src/constants/sizes.dart';
import 'package:classico/src/constants/text_strings.dart';
// import 'package:classico/src/features/authentication/controllers/signup_controller.dart';
import 'package:classico/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "";
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passCont = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registeration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Reg succesfull",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      } on FirebaseAuthException catch (e) {
        print("error agaya reg ke waqt ");
      }
    }
  }

  // final controller = Get.put(SignupController());
  // final _formKey = GlobalKey<FormState>();
  final size = 30.0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // Set your desired background color here
      ),
    );
    return Scaffold(
      backgroundColor: tWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(tSignupImage),
                  height: size * 0.2,
                ),
                Text(
                  tSignup,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 50, // Set your desired font size
                        fontWeight:
                            FontWeight.bold, // Set your desired font weight
                      ),
                ),
                Text(
                  tSignuptext,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                /*Section 2 form*/
                Form(
                    child: Container(
                  padding: EdgeInsets.symmetric(vertical: tFormHeigh - 10),
                  // key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        // controller: controller.fullname,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          labelText: "Full Name",
                          hintText: "full name...",
                          border: OutlineInputBorder(),
                          filled: true, // Add background color
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeigh - 20,
                      ),
                      TextFormField(
                        // controller: controller.email,
                        controller: emailCont,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          labelText: tEmail,
                          hintText: tEmail,
                          border: OutlineInputBorder(),
                          filled: true, // Add background color
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeigh - 20,
                      ),
                      TextFormField(
                        // controller: controller.phoneno,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mobile_screen_share_outlined),
                          labelText: "Mobile no",
                          hintText: "Mobile...",
                          border: OutlineInputBorder(),
                          filled: true, // Add background color
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeigh - 20,
                      ),
                      TextFormField(
                        controller: passCont,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.fingerprint),
                          labelText: tPass,
                          hintText: tPass,
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp),
                          ),
                          filled: true, // Add background color
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeigh - 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            print("pressed ");
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = emailCont.text;
                                password = passCont.text;
                              });
                            }
                            registeration();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            tSignup,
                            style: Theme.of(context)
                                ?.textTheme
                                ?.titleLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Or"),
                    const SizedBox(
                      height: tFormHeigh - 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(),
                        icon: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: const Image(
                            image: AssetImage(
                                tGooglelogoimage), // Replace with your image asset path
                            width: 20.0,
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Sign up with Google"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: tFormHeigh - 20.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(
                            text: "Alread have account?",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(
                                  text: tLogin,
                                  style: TextStyle(color: Colors.blue))
                            ])))
                  ],
                )
              ],
            ),
          ), //piigy
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
