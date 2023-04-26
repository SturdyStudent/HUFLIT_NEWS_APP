import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register(UserObj user) async {
    await _auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }

  Future login(UserObj user) async {
    return await _auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
  }
}
