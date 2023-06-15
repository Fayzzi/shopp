import 'package:flutter/material.dart';

import '../AuthServices/FirebaseAuth.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final email = new TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Password Recovery",
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
                    image: DecorationImage(
                        image: AssetImage('images/passworddrecovery.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enter your Email",
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
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter your account's Email",
                        style: TextStyle(color: Colors.black),
                      ),
                      helperText:
                          "You Will Recieve a Password Change link on your Email",
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
                            if (email.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "No Email was Found!!",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              );
                            } else {
                              await authService()
                                  .passwordRecovery(email.text, context);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "Link Sent please check your E-mail",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
