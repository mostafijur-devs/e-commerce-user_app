import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_ecom_app/models/card_model.dart';
import 'package:user_ecom_app/models/user_model.dart';

class CardDbHelper {
  static final _db = FirebaseFirestore.instance;
  static final _collectionCard = 'MyCards';
  static final _collectionUser = 'Users';

  CardDbHelper._();
 /// add 'MyCards' collection to 'Products' collection in firebase
  static Future<void> addCard (CardModel cardModel , String uid) {
    return _db.collection(_collectionUser)
        .doc(uid)
        .collection(_collectionCard)
    .doc(cardModel.productId).set(cardModel.toMap());
  }
 static Future<void> removeCard(String pid, String uid){
    return _db.collection(_collectionUser)
        .doc(uid)
        .collection(_collectionCard)
        .doc(pid).delete();

  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCardsItemsByUser(String uid) {
   return _db.collection(_collectionUser).doc(uid).collection(_collectionCard)
        .snapshots();
}
}