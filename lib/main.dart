import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shopify/screen/homepage.dart';
import 'package:shopify/screen/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopify/tabs/Alltab/AllTab.dart';

import 'bottomnavigation/mybottomnavigationbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const runapp());
}

class runapp extends StatelessWidget {
  const runapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'loginscreen',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Column(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  //shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('images/oj.png'), fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "All you need is here",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
        splashIconSize: 300,
        backgroundColor: Colors.white,
        nextScreen: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const mybottomNavigation();
            } else {
              return const LoginPAge();
            }
          },
        ),
      ),
    );
  }
}
