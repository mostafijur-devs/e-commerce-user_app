import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_ecom_app/models/user_model.dart';

class UserDbHelper{
  UserDbHelper._();
  static final _db = FirebaseFirestore.instance;
  static const String _collectionUser = 'Users';

  static Future<void> addNewUser (UserModel userModel) {
    return _db.collection(_collectionUser).doc(userModel.uid)
        .set(userModel.toMap());
  }


}