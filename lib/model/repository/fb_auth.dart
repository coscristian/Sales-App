import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAutheticationRepository {
  Future<void> createEmailPasswordAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('La clave es muy facil de adivinar.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  Future<void> signInEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no existe.');
      } else if (e.code == 'wrong-password') {
        return Future.error('Cedenciales invalidas.');
      }
    }
  }
}
