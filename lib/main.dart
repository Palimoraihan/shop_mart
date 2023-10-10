import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mart/constant/constant.dart';
import 'package:shop_mart/features/auth/page/auth_page.dart';
import 'package:shop_mart/features/auth/page/home_page.dart';
import 'package:shop_mart/features/auth/services/auth_services.dart';
import 'package:shop_mart/features/auth/widget/bottom_bar.dart';
import 'package:shop_mart/provider/user_provider.dart';
import 'package:shop_mart/routes/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();
  @override
  void initState() {
    authServices.getUser(context);
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GlobalVariables.lightTheme,
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty?const BottomBar() :const AuthPage(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
