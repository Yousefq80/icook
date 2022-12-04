import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-up"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(hintText: "Username"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required field";
                }

                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required field";
                }

                return null;
              },
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Confirm Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required field";
                }

                if (passwordController.text != value) {
                  return "Password doesn't match";
                }

                return null;
              },
            ),
            // to insert button
            Spacer(),
            TextButton(
              onPressed: () {
                context.go('/SignIn');
              },
              child: Text("if you have an acount sign in "),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  print("vlid");
                } else {
                  print("form not valid");
                }
              },
              child: Text("Signup"),
            ),
          ]),
        ),
      ),
    );
  }
}
