import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class LoginWidget extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? buttonTap;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginWidget({
    Key? key,
    required this.onTap,
    required this.emailController,
    required this.passwordController,
    required this.buttonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  controller: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('don\'t have account ? '),
                    IconButton(
                        splashRadius: 10,
                        color: GlobalVariables.secondaryColor,
                        onPressed: onTap,
                        icon: const Icon(Icons.person_add_alt_rounded))
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: ElevatedButton(
                onPressed: buttonTap,
                child: const Text('Login'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
