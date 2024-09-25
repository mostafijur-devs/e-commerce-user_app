import 'package:flutter/material.dart';
import 'package:user_ecom_app/pages/card_page.dart';
import 'package:user_ecom_app/pages/order_page.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, required this.cartCount});

  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CardPage.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            Positioned(
              top: -5,
              left: -5,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  cartCount.toString(),
                  style: const TextStyle(fontSize: 10,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
