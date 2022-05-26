import 'package:chops/models/chop_user.dart';
import 'package:chops/utils/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static final _auth = FirebaseAuth.instance;
  static Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      showSnackBar(err.toString());
    } catch (_) {
      showSnackBar('something went wrong');
    }
  }

  static Future<ChopUser> getUserInfo() async {
    final userInfo = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return ChopUser.fromFirestore(userInfo.data() as Map<String, dynamic>);
  }

  static Future<void> signUp(Map<String, dynamic> userInfo) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
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
}
