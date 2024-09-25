
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/firebase_options.dart';
import 'package:user_ecom_app/pages/category_page.dart';
import 'package:user_ecom_app/pages/login_page.dart';
import 'package:user_ecom_app/pages/luancher_page.dart';
import 'package:user_ecom_app/pages/order_page.dart';
import 'package:user_ecom_app/pages/product_details_page.dart';
import 'package:user_ecom_app/pages/user_page.dart';
import 'package:user_ecom_app/pages/view_product_page.dart';
import 'package:user_ecom_app/providers/auth_provider.dart';
import 'package:user_ecom_app/providers/card_provider.dart';
import 'package:user_ecom_app/providers/product_provider.dart';

void main() async {
  // You only need to call this method if you need the binding to be initialized before calling runApp.
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform // firebase options
  );
  runApp(
      // use multiple provider
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider(),),
      ChangeNotifierProvider(create: (context) => FirebaseAuthProvider(),),
      ChangeNotifierProvider(create: (context) => CardProvider(),),
    ],
      child: const MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // use google font
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),//
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      // initialRoute: LoginPage.routeName,
      initialRoute: LuancherPage.routeName,
      // all route name
      routes: {
        LuancherPage.routeName :(context) => const LuancherPage(),
        LoginPage.routeName : (context) => const LoginPage(),
        CategoryPage.routeName : (context) => const CategoryPage(),
        ViewProductPage.routeName : (context) => const ViewProductPage(),
        OrderPage.routeName : (context) => const OrderPage(),
        ProductDetailPage.routeName : (context) => const ProductDetailPage(),
        UserPage.routeName : (context) => const UserPage(),
      },
    );
  }
}
