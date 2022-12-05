import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              CupertinoTextFormFieldRow(
                controller: usernameController,
                placeholder: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  return null;
                },
              ),
              CupertinoTextFormFieldRow(
                controller: passwordController,
                obscureText: true,
                placeholder: "Password",
                // decoration: InputDecoration(hintText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  return null;
                },
              ),
              CupertinoTextFormFieldRow(
                controller: confirmPasswordController,
                obscureText: true,
                // decoration: InputDecoration(hintText: "Confirm Password"),
                placeholder: "Confirm Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  if (passwordController.text != value) {
                    return "Password doesn't match!";
                  }

                  return null;
                },
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var didSignup = await context.read<AuthProvider>().signup(
                          username: usernameController.text,
                          password: passwordController.text);
                      if (didSignup) {
                        context.go("/list");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Signup unsuccessful",
                              textAlign: TextAlign.center,
                            )));
                      }
                    } else {
                      print("form not valid");
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
