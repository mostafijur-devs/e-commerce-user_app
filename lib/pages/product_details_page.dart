import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/models/product_model.dart';
import 'package:user_ecom_app/providers/product_provider.dart';
import 'package:user_ecom_app/utils/widgets_function.dart';

class ProductDetailPage extends StatefulWidget {
  static const String routeName = '/product_details_page';

  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ProductModel productModel;

  @override
  void didChangeDependencies() {
    final id = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    productModel = context.watch<ProductProvider>().getProductById(id);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          actions: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.logout))
          ],
        ),
        body: Consumer<ProductProvider>(
          builder: (context, productProvider, child) => ListView(
            children: [
              //CachedNetWorkImage design or commend
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30,),
                child: Card(
                  elevation: 100,
                  child: CachedNetworkImage(
                    imageUrl: productModel.imageUrl,
                    width: 100,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fadeInDuration: const Duration(milliseconds: 1000),
                    fadeOutCurve: Curves.bounceIn,
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              ListTile(
                title: Text('Product: ${productModel.productName}',
                  style: const TextStyle(fontSize: 20),),
                trailing: IconButton(onPressed: () {
                  showSingleTextInputButton(
                      context: context,
                      keyboardType: TextInputType.number,
                      title: 'Update Product',
                      positiveText: 'Update',
                      onSave: (value) {
                    productProvider.updateSingleProductField(productModel.id!, 'productName', value);
                    showMassage(context: context, message: 'Product name updated');

                  },);

                }, icon: const Icon(Icons.edit)),
              ),
              ListTile(
                title: Text('Price: ${productModel.price}',
                  style: const TextStyle(fontSize: 20),),
                trailing: IconButton(onPressed: () {

                  showSingleTextInputButton(
                    context: context,
                    keyboardType: TextInputType.number,
                    title: 'Update Price',
                    positiveText: 'Update',
                    onSave: (value) {
                      productProvider.updateSingleProductField(productModel.id!, 'price', num.parse(value));
                      showMassage(context: context, message: 'Price updated');

                      },
                  );
                }, icon: const Icon(Icons.edit)),
              ),
              ListTile(
                title: Text('Discount: ${productModel.discount}',
                  style: const TextStyle(fontSize: 20),),
                trailing: IconButton(onPressed: () {
                  showSingleTextInputButton(
                    context: context,
                    keyboardType: TextInputType.number,
                    title: 'Update discount',
                    positiveText: 'Update',
                    onSave: (value) {
                      productProvider.updateSingleProductField(productModel.id!, 'discount', num.parse(value));
                      showMassage(context: context, message: 'discount updated');

                    },);

                }, icon: const Icon(Icons.edit)),
              ),
              ListTile(
                title: Text(
                  'Price of discount:   ${productModel.priceAfterDiscount}',
                  style: const TextStyle(fontSize: 20),),

              ),
              ListTile(
                title: Text('Product discription : ${productModel.description}',
                  style: const TextStyle(fontSize: 17),),
                trailing: IconButton(onPressed: () {

                  showSingleTextInputButton(
                    context: context,
                    keyboardType: TextInputType.number,
                    title: 'Update discription',
                    positiveText: 'Update',
                    onSave: (value) {
                      productProvider.updateSingleProductField(productModel.id!, 'description', value);
                      showMassage(context: context, message: 'Driscription updated');

                    },);

                }, icon: const Icon(Icons.edit)),
              ),
              ListTile(
                title: Text('Stock : ${productModel.stock}',
                  style: const TextStyle(fontSize: 17),),
                trailing: IconButton(onPressed: () {

                  showSingleTextInputButton(
                    context: context,
                    keyboardType: TextInputType.number,
                    title: 'Update discription',
                    positiveText: 'Update',
                    onSave: (value) {
                      productProvider.updateSingleProductField(productModel.id!, 'stock', num.parse(value));
                      showMassage(context: context, message: 'Stock updated');

                    },);

                }, icon: const Icon(Icons.edit)),
              ),
              SwitchListTile(
                title: Text('Product avalable ',
                  style: const TextStyle(fontSize: 17),),
                value: productModel.available,
                onChanged: (value) {
                  productProvider.updateSingleProductField(productModel.id!, 'available', value);
                  showMassage(context: context, message: 'status updated');
                },
              ),



            ],
          ),
        )
    );
  }
}
