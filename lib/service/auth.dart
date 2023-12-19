import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_mount/data/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  UserCreate? _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? UserCreate(uid: user.uid) : null;
  }

  Stream<UserCreate?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  // sign in with email and password

  Future signInEAP(String em, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: em, password: pass);
      User? user = result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerEAP(String em, String pass) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: em, password: pass);
      User? user = result.user;

      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Future<void> signOut() async {
  //   await _userFromFirebase.signOut();
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
  // sign out

