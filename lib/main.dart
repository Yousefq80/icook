import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'SignIn.dart';
import 'SignUp.dart';

void main() {
  runApp(MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (contest, state) => SignUp(),
  ),
  GoRoute(
    path: '/SignIn',
    builder: (context, state) => SignIn(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
