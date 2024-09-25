
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/customswidgets/product_grid_item.dart';
import 'package:user_ecom_app/pages/luancher_page.dart';
import 'package:user_ecom_app/pages/product_details_page.dart';
import 'package:user_ecom_app/providers/auth_provider.dart';
import 'package:user_ecom_app/providers/card_provider.dart';
import 'package:user_ecom_app/providers/product_provider.dart';

class ViewProductPage extends StatelessWidget {
  static const String routeName = '/viewproductpage';

  const ViewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductProvider>().getAllProducts();
    context.read<ProductProvider>().getAllCategories();
    context.read<CardProvider>().getAllCardsItemsByUser(context.read<FirebaseAuthProvider>().currentUser!.uid);
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Product'),
          actions: [
            IconButton(onPressed: () {
              context.read<FirebaseAuthProvider>().logOut();
              Navigator.pushReplacementNamed(context, LuancherPage.routeName);
            }, icon: const Icon(Icons.logout))
          ],
        ),
        body: Consumer<ProductProvider>(
          builder: (context, productProvider, child) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:0.65 ,
              // mainAxisSpacing: 1/2,
              // crossAxisSpacing: 2,
            ),
            itemCount: productProvider.productList.length,
            itemBuilder: (context, index) {
              final product = productProvider.productList[index];
              return ProductGridItem(productModel: product,);
            },
          ),
        ));
  }
}
