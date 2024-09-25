import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:user_ecom_app/pages/card_page.dart';
import 'package:user_ecom_app/pages/luancher_page.dart';

import 'package:user_ecom_app/providers/auth_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.red,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Theme.of(context).colorScheme.primaryContainer,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.person),
            title: const Text('My Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              EasyLoading.show(status: 'Please wait....');
              Navigator.pushNamed(context, CardPage.routeName);
              EasyLoading.dismiss();

            },
            leading: Icon(Icons.shopping_cart),
            title: const Text('My Card'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.monetization_on_rounded),
            title: const Text('My Orders'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              context.read<FirebaseAuthProvider>().logOut();
              Navigator.pushReplacementNamed(context, LuancherPage.routeName);
            },
            leading: Icon(Icons.logout),
            title: const Text('Log Out'),
          ),
        ],

      ),
    );
  }
}
