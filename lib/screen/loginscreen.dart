import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify/bottomnavigation/mybottomnavigationbar.dart';
import 'package:shopify/screen/SignUp.dart';
import 'package:shopify/screen/homepage.dart';

import '../AuthServices/FirebaseAuth.dart';
import 'forgotpassword.dart';

class LoginPAge extends StatefulWidget {
  const LoginPAge({Key? key}) : super(key: key);

  @override
  State<LoginPAge> createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPAge> {
  final email = new TextEditingController();
  final pass = new TextEditingController();
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
          "Log in",
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
                    child: Image.asset('images/shopping.png')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enter Credentials to Login please",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
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
                    textInputAction: TextInputAction.go,
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
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => forgotpassword(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                loading
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white70,
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
                            if (email.text == "" || pass.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "All Fields are Required!!",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              );
                            } else {
                              User? user = await authService()
                                  .Login(email.text, pass.text, context);
                              if (user != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const mybottomNavigation()),
                                    (route) => false);
                              }
                            }
                            setState(() {
                              loading = false;
                            });
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        )),
                      ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loading
                        ? CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            color: Colors.white70,
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Firebase.initializeApp();
                                User? user =
                                    await authService().GoogleSignin(context);
                                if (user != null) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const mybottomNavigation()),
                                      (route) => false);
                                }
                                setState(() {
                                  loading = false;
                                });
                              },
                              child: const Image(
                                  image: AssetImage('images/google.png')),
                            ),
                          ),
                    Container(
                      height: 50,
                      width: 50,
                      child: TextButton(
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/facebook.png')),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: TextButton(
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/twitter.png')),
                      ),
                    ),
                  ],
                ),
                //Spacer(),
                const SizedBox(
                  height: 60,
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              "SignUP",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
