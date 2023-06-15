import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class authService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User?> Register(
      String email, String Pass, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: Pass);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  Future<User?> Login(String email, String Pass, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: Pass);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  Future<User?> passwordRecovery(String email, BuildContext context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  Future GoogleSignin(BuildContext context) async {
    try {
      GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      if (googleuser != null) {
        GoogleSignInAuthentication auth = await googleuser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  Future Signout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }
}
