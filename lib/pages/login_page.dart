import 'package:anime_list_app/component/my_button.dart';
import 'package:anime_list_app/component/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            MyTextField(hintText: 'username', controller: usernameController, obscureText: false)
            MyButton(
                text: 'Login',
                onpressed: () {
                  Get.toNamed('/home');
                }),
            TextButton(
              onPressed: () {
                Get.toNamed('/singup');
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
