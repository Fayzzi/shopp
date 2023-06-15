import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../AuthServices/FirebaseAuth.dart';
import '../bottomnavigation/mybottomnavigationbar.dart';
import 'homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "";
  String Email = "";
  String password = "";
  final first = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final cpass = TextEditingController();
  bool loading = false;
  bool _obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Register",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                    ),
                    child: Image.asset('images/verified.png')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Fill The Registration form to Register",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: first,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter your First name",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onSubmitted: (value) {
                      name = first.text;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onSubmitted: (value) {
                      Email = email.text;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: pass,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    obscureText: _obscuretext,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscuretext = !_obscuretext;
                          });
                        },
                        icon: Icon(
                          _obscuretext
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onSubmitted: (value) {
                      password = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: cpass,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscuretext,
                    decoration: InputDecoration(
                      hintText: "Enter your password again",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscuretext = !_obscuretext;
                          });
                        },
                        icon: Icon(
                          _obscuretext
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                loading
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white54,
                        color: Colors.black,
                      )
                    : Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if (email.text == "" || first.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "All Fields need to filled!!",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                );
                              }
                              if (pass.text != cpass.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Both Passwords must Match!!",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                );
                              }
                              else {
                                User? user = await authService()
                                    .Register(email.text, pass.text, context);
                                if (user != null) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const mybottomNavigation()),
                                      (route) => false);
                                }
                              }
                              setState(() {
                                loading = false;
                              });
                            },
                            child: const Text(
                              'Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
