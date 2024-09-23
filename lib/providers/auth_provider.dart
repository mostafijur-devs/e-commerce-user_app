import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:user_ecom_app/db/db_helper.dart';
import 'package:user_ecom_app/db/user_db_helper.dart';
import 'package:user_ecom_app/models/user_model.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  // get massage => null;

  Future<void> loginUser(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

  }

  Future<void> registerUser(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserDbHelper.addNewUser(
      UserModel(
        uid: credential.user!.uid,
        email: email,
        creationTime:Timestamp.fromDate(credential.user!.metadata.creationTime!),
      ),
    );
  }

  Future<void> logOut() => _auth.signOut();
}
