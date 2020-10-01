import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  static final auth = FirebaseAuth.instance;

  static Future<void> logout() async {
    await auth.signOut();
  }

}