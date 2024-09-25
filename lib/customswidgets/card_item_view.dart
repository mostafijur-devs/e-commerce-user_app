import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_ecom_app/models/card_model.dart';
import 'package:user_ecom_app/utils/constant.dart';

class CardItemView extends StatelessWidget {
  const CardItemView({
    super.key,
    required this.cardModel,
    required this.onAddButtonClick,
    required this.onRemoveButtonClick,
    required this.deleteCard,
  });

  final CardModel cardModel;
  final VoidCallback onAddButtonClick;
  final VoidCallback onRemoveButtonClick;
  final VoidCallback deleteCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: ListTile(
              leading: Card(
                margin: EdgeInsets.zero,
                child: CachedNetworkImage(
                  width: 100,
                  fit: BoxFit.cover,
                  imageUrl: cardModel.image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fadeInDuration: const Duration(seconds: 1),
                  fadeInCurve: Curves.bounceIn,
                ),
              ),
              title: Text(cardModel.name),
              trailing: Text('$currency${cardModel.price}'),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {
                onRemoveButtonClick();
              }, icon: Icon(Icons.remove_circle)),
              Text(cardModel.quantity.toString()),
              IconButton(onPressed: () {
                onAddButtonClick();
              }, icon: Icon(Icons.add_circle)),
              const Spacer(),
              Text(
                '${cardModel.priceWithQuantity}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed:deleteCard , icon: const Icon(Icons.delete,color: Colors.red,))

            ],
          )
        ],
      ),
    );
  }
}
