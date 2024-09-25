import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/customswidgets/card_item_view.dart';
import 'package:user_ecom_app/providers/auth_provider.dart';
import 'package:user_ecom_app/providers/card_provider.dart';

class CardPage extends StatelessWidget {
  static const routeName = '/mycard_page';

  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // backgroundColor: Colors.blueGrey.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Card pge'),
      ),
      body: Consumer<CardProvider>(builder: (context, cardProvider, child) =>
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                
                  itemCount: cardProvider.cardList.length,
                  itemBuilder: (context, index) {
                    final card = cardProvider.cardList[index];
                    return CardItemView(
                      deleteCard: () {
                        cardProvider.removeFromCard(context
                            .read<FirebaseAuthProvider>()
                            .currentUser!
                            .uid, card.productId);
                      },
                        cardModel: card,
                        onAddButtonClick: () {
                          cardProvider.increaseCardQuntity(
                              context
                                  .read<FirebaseAuthProvider>()
                                  .currentUser!
                                  .uid, card);
                        },
                        onRemoveButtonClick: (){
                      cardProvider.decreaseCardQuntity(
                        context.read<FirebaseAuthProvider>().currentUser!.uid, card,);
                    },);
                
                  },
                
                ),
              ),

              ListTile(
                title: Text('Total Price :'),
                trailing: Text('${cardProvider.getCardTotalPrice}'),
              )
            ],
          ),),

    );
  }
}
