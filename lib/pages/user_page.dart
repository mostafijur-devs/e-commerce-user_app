import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  static const routeName = '/user-page';
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),

    );
  }
}
