import 'package:classico/src/features/authentication/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot_pass extends StatefulWidget {
  Forgot_pass({Key? key}) : super(key: key);

  @override
  State<Forgot_pass> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgot_pass> {
  String email = "";
  TextEditingController emailCont = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  resetpass() async {
    try {
      if (email != null) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password reset mail has been sent.",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (e) {
      print("Error due to something!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(133, 60, 8, 8),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.0),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Password Recovery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Enter your mail",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Form(
                        child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white70, width: 2.0),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: emailCont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the email";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white70,
                                size: 30.0,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: 30.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                email = emailCont.text;
                              });
                              resetpass();
                            }
                          },
                          child: Text("Send mail "),
                        ),
                      )
                    ],
                  ),
                )))
              ],
            )),
      ),
    );
  }
}
