import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mart/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Text('Name : ${user.name}'),
      ),
    );
  }
}
