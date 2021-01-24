import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future Login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (mail.isEmpty) {
      throw ('パスワードを入力してください');
    }

    await _auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
  }
}
