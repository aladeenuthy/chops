import 'package:chops/utils/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static Future<void> signUp(Map<String, dynamic> userInfo) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userInfo['email'], password: userInfo['password']);
      userInfo.remove('password');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set(userInfo);
    } on FirebaseAuthException catch (err) {
      showSnackBar(err.toString());
    } catch (_) {
      showSnackBar("something went wrong");
    }
  }

  static Future<void> signIn(String email, String password) async {}
}
