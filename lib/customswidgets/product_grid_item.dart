import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/models/product_model.dart';
import 'package:user_ecom_app/pages/product_details_page.dart';
import 'package:user_ecom_app/providers/auth_provider.dart';
import 'package:user_ecom_app/providers/card_provider.dart';
import 'package:user_ecom_app/utils/constant.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailPage.routeName,
            arguments: productModel.id);
      },
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: productModel.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 220,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error),
                        ),
                        fadeInDuration: const Duration(milliseconds: 1000),
                        fadeInCurve: Curves.bounceIn,
                      ),
                      if (productModel.discount > 0)
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 70,
                          color: Colors.black.withOpacity(0.4),
                          child: Text(
                            '${productModel.discount}% OFF',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                    ],
                  ),
                ),
                Text(
                  productModel.productName,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (productModel.discount > 0)
                  RichText(
                    text: TextSpan(
                        text: '$currency ${productModel.priceAfterDiscount}  ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        children: [
                          TextSpan(
                            text: ' ${productModel.price}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ]),
                  ),
                if (productModel.discount == 0)
                  Text(
                    '$currency ${productModel.price}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ElevatedButton(onPressed: () {}, child: const Text('Buy')),
                Consumer<CardProvider>(
                  builder: (context, cardProvider, child) {
                    final isInCard = cardProvider.isProductInCard(productModel.id!);
                    return ElevatedButton(
                      onPressed: () {
                        if(isInCard){
                          cardProvider.removeFromCard(context.read<FirebaseAuthProvider>().currentUser!.uid,productModel.id!);

                        }else{
                          cardProvider.addProductToCard(productModel,
                              context.read<FirebaseAuthProvider>().currentUser!.uid);
                        }
                      },
                      child: isInCard ? const Text('Remove From Cart') : const Text('ADD TO CART'),
                    );
                  },
                ),
              ],
            ),
            if (productModel.stock == 0)
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.black.withOpacity(0.2),
                child: Card(
                  elevation: 20,
                  child: const Text(
                    'OUT OF STOCK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
