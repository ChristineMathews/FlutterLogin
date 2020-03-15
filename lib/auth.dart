import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  /*Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();*/
}
class Auth implements BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
    return user?.uid;
  }
}