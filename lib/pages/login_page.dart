import 'package:anime_list_app/component/my_button.dart';
import 'package:anime_list_app/component/my_textfield.dart';
import 'package:anime_list_app/controller/auth_controller.dart';
import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login to your Account!',
                style: MyFonts.primaryFont(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                  hintText: 'Username',
                  controller: usernameController,
                  obscureText: false,
                  textStyle: MyFonts.primaryFont(
                    fontSize: 16,
                  )),
              const SizedBox(height: 15),
              MyTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
                textStyle: MyFonts.primaryFont(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MyButton(
                  bgColor: MyColors.primaryColor,
                  fgColor: MyColors.primaryLightColor,
                  text: 'Login',
                  onpressed: () async {
                    await authController.login(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                  textStyle: MyFonts.primaryFont(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: const Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
