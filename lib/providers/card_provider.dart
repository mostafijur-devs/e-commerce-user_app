import 'package:flutter/foundation.dart';
import 'package:user_ecom_app/db/card_db_helper.dart';
import 'package:user_ecom_app/models/card_model.dart';
import 'package:user_ecom_app/models/product_model.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> cardList = [];

  int get totalItemsInCard => cardList.length;

  bool isProductInCard(String pid){
    bool tag = false;
    for (final card in cardList){
      if(card.productId == pid){
        tag = true;
        break;
      }
    }
    return tag;
  }

  Future<void> addProductToCard(ProductModel productModel, String uid) async {
    final cardModel = CardModel(
      productId: productModel.id!,
      name: productModel.productName,
      price: productModel.priceAfterDiscount,
      image: productModel.imageUrl,
      quantity: productModel.stock,
    );
    return CardDbHelper.addCard(cardModel, uid);
  }

  Future<void> removeFromCard(String uid, String pid){
    return CardDbHelper.removeCard(pid, uid);
  }
  getAllCardsItemsByUser(String uid) {
    CardDbHelper.getAllCardsItemsByUser(uid)
        .listen((snapshot) {
          cardList = List.generate(snapshot.docs.length, (index) {
           return CardModel.fromMap(snapshot.docs[index].data());},);
          notifyListeners();
    },);
  }
   Future<void> increaseCardQuntity(String uid, CardModel cardModel)  {
    final newQuantity = cardModel.quantity + 1;
    return CardDbHelper.updateCardQuntity(cardModel.productId, uid, newQuantity);
   }

   Future<void> decreaseCardQuntity(String uid, CardModel cardModel) async  {
    if(cardModel.quantity >1){
      final newQuantity = cardModel.quantity - 1;
      await CardDbHelper.updateCardQuntity(cardModel.productId, uid, newQuantity);
    }
   }

   num get getCardTotalPrice{
     num totalPrice = 0;
     for(final card in cardList){
       totalPrice += card.priceWithQuantity;
     }
     return totalPrice;
   }
  // updateCardQuntitys(String pid,String uid, int quantity)  {
  //   CardDbHelper.updateCardQuntity(pid,uid, quantity);
  // }

}
