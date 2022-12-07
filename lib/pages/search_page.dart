import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recipes_provider.dart';
import '../widgets/no_recipes.dart';
import '../widgets/recipe_list_tile.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? textEditingController = TextEditingController();

  List<String> recipes = [
    'test 1',
    'test 2',
    'test 3',
    'test 4',
    'test 5',
    'test 6',
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSearchTextField(
          onChanged: (value) {
            recipes =
                recipes.where((element) => element.contains(value)).toList();
          },
          controller: textEditingController,
          placeholder: 'Search categories',
          autocorrect: false,
          padding: EdgeInsets.symmetric(horizontal: 16),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Color.fromARGB(255, 187, 35, 24),
          ),
          placeholderStyle: TextStyle(
            color: Colors.black54,
          ),
          style: TextStyle(
            color: Colors.black54,
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.extraLightBackgroundGray,
            border: Border.all(
              color: CupertinoColors.extraLightBackgroundGray,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          // decoration: BoxDecoration,
        ),
        trailing: Spacer(),
      ),
      child: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NoRecipes(),
          ],
        ),
      )

          //           NoRecipes(),
          // CustomScrollView(
          //   // semanticChildCount: 15,
          //   slivers: [
          //     SliverList(
          //       delegate: SliverChildListDelegate(
          //         [
          //           Row(
          //             children: [
          //               Icon(Icons.food_bank),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Text(
          //                 'data',
          //                 style: TextStyle(
          //                     fontSize: 25, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),

          //           // if (context.watch<RecipesProvider>().isLoading)
          //           //   LinearProgressIndicator()
          //           // else
          //           //   ...context
          //           //       .watch<RecipesProvider>()
          //           //       .recipes
          //           //       .map((recipe) => RecipeListTile(
          //           //             recipe: recipe,
          //           //           ))
          //           //       .toList(),

          //           // for (var i = 0; i < 100; i++) Text('Recipe $i'),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: TextField(
    //       controller: textEditingController,
    //       decoration: InputDecoration(),
    //     ),
    //   ),
    // );
  }
}
