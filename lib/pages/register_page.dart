import 'package:flutter/material.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/components/my_text_field.dart';


class ResgisterPage extends StatefulWidget {

  final void Function()? onTap;
  const ResgisterPage({super.key, required this.onTap});

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
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

            MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obsecureText: true,
            ),

            const SizedBox(
              height: 10,
            ),

            MyButton(
              onTap: () {},
              text: "Sign Up",
            ),

            const SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),

                const SizedBox(
                  width: 4,
                ),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Sign in",
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
    );
  }
}