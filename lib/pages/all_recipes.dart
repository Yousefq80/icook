import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/no_recipes.dart';
import '../widgets/recipe_list_tile.dart';

class AllRecipesScreen extends StatelessWidget {
  const AllRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('All Recipes'),
            leading: CupertinoButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Icon(
                CupertinoIcons.person_add_solid,
                size: 27,
                color: Colors.black87,
              ),
            ),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              },
              child: Icon(
                CupertinoIcons.plus_rectangle_fill,
                size: 27,
                color: Colors.black87,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                RecipeListTile(),
                RecipeListTile(),
                RecipeListTile(),
                RecipeListTile(),
                RecipeListTile(),
                RecipeListTile(),
                RecipeListTile(),
                NoRecipes(),
                // for (var i = 0; i < 100; i++) Text('Recipe $i'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
