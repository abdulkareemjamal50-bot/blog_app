import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  User? get currentUser {
    return firebaseAuth.currentUser;
  }
}