import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook/providers/recipes_provider.dart';
import 'package:icook/widgets/new_form.dart';
import 'package:icook/widgets/recipe_detail_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../models/recipes_model.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                label: 'Edit',
                onPressed: ((context) async {
                  await context
                      .read<RecipesProvider>()
                      .editRecipe; //*    <---------  EDIT RECIPE
                }),
                backgroundColor: Colors.blue,
                icon: Icons.edit,
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                label: 'Delete',
                onPressed: ((context) async {
                  await context
                      .read<RecipesProvider>()
                      .deleteRecipe; //*    <---------  DELETE RECIPE
                }),
                backgroundColor: Colors.red,
                icon: Icons.delete,
              ),
            ],
          ),
          child: CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) => RecipeDetail(
                        recipe: recipe,
                      ));
            },
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(recipe.image),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        recipe.category,
                        style: TextStyle(
                          color: Color.fromARGB(255, 187, 35, 24),
                          fontSize: 15,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      recipe.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "By: ${recipe.user}",
                      style: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      recipe.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}
