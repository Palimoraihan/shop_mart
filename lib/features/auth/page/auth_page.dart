import 'package:flutter/material.dart';
import 'package:shop_mart/features/auth/services/auth_services.dart';
import 'package:shop_mart/features/auth/widget/login_widget.dart';
import 'package:shop_mart/features/auth/widget/register_widget.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/auth-page';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  PageController pageController = PageController(initialPage: 0);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reqisterUserNameController =
      TextEditingController();

  final AuthServices authServices = AuthServices();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reqisterUserNameController.dispose();
    super.dispose();
  }

  void signUp() {
    authServices.signUpUser(
        name: reqisterUserNameController.text,
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  void signIn() {
    authServices.signInUser(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            LoginWidget(
              onTap: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              emailController: emailController,
              passwordController: passwordController,
              buttonTap: () {
                print('tap login');

                if (
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  print('all data not null');
                  return signIn();
                }
              },
            ),
            RegisterWidget(
              onTap: () {
                pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              usernameController: reqisterUserNameController,
              passwordController: passwordController,
              emailController: emailController,
              buttonTap: () {
                print('tap');
                if (reqisterUserNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  print('all data not null');
                  return signUp();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
