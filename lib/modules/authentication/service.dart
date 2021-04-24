import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/core/firestore/firebase_auth_instance_provider.dart';
import 'package:myapp/core/firestore/model.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/firestore.dart';
import 'package:myapp/core/services/navigator.dart';

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

  static void handleSuccessfulSignIn() {
    FirestoreService.getUser().then((userDocumentSnapshot) {
      final UserModel user = UserModel.fromMap(userDocumentSnapshot);

      print(user);

      if (user.tags == null || user.tags.isEmpty) {
        NavigatorService.instance.navigateTo(routeTags);
      } else {
        NavigatorService.instance.navigateTo(routeActivities);
      }
    });
  }

  static Future<String> register(String email, String password) async {
    try {
      await getFirebaseAuthInstance()
          .createUserWithEmailAndPassword(email: email, password: password);
      return "200";
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
