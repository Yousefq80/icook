import 'package:flutter/cupertino.dart';

class NewRecipeScreen extends StatelessWidget {
  const NewRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Add Recipe'),
      ),
      child: CustomScrollView(),
    );
  }
}
