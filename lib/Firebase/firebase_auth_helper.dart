import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/pinput_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();

  static FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Snakbar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CreateNewUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Snakbar('The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        Snakbar('The account already exists for that email.', context);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<TUser> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();
    userData['id'] = document.id;
    TUser gdUser = TUser.fromMap(userData);
    return gdUser;
  }

  editUser(TUser user) async {
    await firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update(user.toMap());
  }

  signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Snakbar('user-not-found', context);
      } else if (e.code == '') {
        Snakbar('No user found for that email.', context);
      } else if (e.code == 'wrong-password') {
        print(e.code.toString() + 'Hunter');
        Snakbar('Wrong password provided for that user.', context);
      }
    }
  }

  logout() async {
    await firebaseAuth.signOut();
  }

  forgetPassword(String email) async {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail() async {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  registerUsingPhone(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        return credential;
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        RouterClass.routerClass.pushToSpecificScreenUsingWidget('/PinputScreen');
        log(verificationId);
        log(resendToken.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
