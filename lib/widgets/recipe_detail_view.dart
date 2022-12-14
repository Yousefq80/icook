import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/recipes_model.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 40),
                      Text(
                        recipe.category,
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 35, 24),
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                            // fontStyle: FontStyle.italic,
                            ),
                      ),
                      // SizedBox(height: 15),
                      Text(
                        recipe.title,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navLargeTitleTextStyle,
                      ),
                      // SizedBox(height: 5),
                      Text(
                        "By: ${recipe.user}",
                        style: TextStyle(
                          color: Colors.blueGrey.shade400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          recipe.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 67, 75),
                          fontSize: 22,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        recipe.description,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 67, 75),
                          fontSize: 22,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        recipe.ingredients,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Instructions",
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 67, 75),
                          fontSize: 22,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        recipe.instructions,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: CupertinoButton(
                          onPressed: () {
                            context.pop();
                          },
                          color: Color.fromARGB(255, 187, 35, 24),
                          child: Text('Go back'),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
