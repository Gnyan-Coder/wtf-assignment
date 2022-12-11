import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wtf_assignment/view/screens/Auth/Login.dart';
import 'package:wtf_assignment/view/screens/Home.dart';
import '../model/UserModel.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  //  User state
  late Rx<User?> _user;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

//  User Register
  void signUp(
      String email,
      String password,
      ) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        MyUser user = MyUser(email: email,uid: credential.user!.uid,);
        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(user.toJson());
      } else {
        Get.snackbar(
            "Error Creating Accounting", "Please enter all required filed");
      }
    } catch (e) {
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Login", "Please Enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error Login", e.toString());
    }
  }
}
