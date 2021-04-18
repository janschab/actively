import 'package:firebase_auth/firebase_auth.dart';

import '../firestore/firebase_auth_instance_provider.dart';

class AuthenticationService {
  static Future<String> signIn(String email, String password) async {
    try {
      await getFirebaseAuthInstance()
          .signInWithEmailAndPassword(email: email, password: password);
      return "200";
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> register(
      String email, String password, String displayName) async {
    try {
      await getFirebaseAuthInstance()
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((response) =>
              response.user.updateProfile(displayName: displayName));
      return "200";
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
