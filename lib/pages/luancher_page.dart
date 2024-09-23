
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/pages/login_page.dart';
import 'package:user_ecom_app/pages/user_page.dart';
import 'package:user_ecom_app/pages/view_product_page.dart';
import 'package:user_ecom_app/providers/auth_provider.dart';


class LuancherPage extends StatefulWidget {
  static const String routeName = '/';
  const LuancherPage({super.key});

  @override
  State<LuancherPage> createState() => _LuancherPageState();
}
class _LuancherPageState extends State<LuancherPage> {
  @override
  void didChangeDependencies() {
    final authProvider = context.read<FirebaseAuthProvider>();
    Future.delayed(const Duration(seconds: 0),() {
      if(authProvider.currentUser != null){
        Navigator.pushReplacementNamed(context, ViewProductPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    },);

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
