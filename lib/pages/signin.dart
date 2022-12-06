import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-In"),
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
        // to insert button
      )),
      // ignore: dead_code
    );
  }
}
