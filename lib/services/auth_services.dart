import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingilizceegitim/models/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _firebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_firebaseUser);
  }

  //Kayıt olma işlemi
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _firebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //giriş yapma işlemi
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _firebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Şifre sıfırlama işlemi
  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Çıkış yapma işlemi
   Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
