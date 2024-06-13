import 'package:flutter/material.dart';
import 'package:food_app/auth/authservice.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/components/my_text_field.dart';
import 'package:food_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    /* fill out authentication here */
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(),
      );
    }

Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Icon(
                    Icons.lock_open_rounded,
                    size: 100,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obsecureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obsecureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  MyButton(
                    onTap: () => login(context),
                    text: "Sign in",
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register now.",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
