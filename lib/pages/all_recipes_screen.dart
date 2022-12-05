import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icook/widgets/new_form.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/recipes_provider.dart';
import '../widgets/no_recipes.dart';
import '../widgets/recipe_list_tile.dart';

class AllRecipesScreen extends StatefulWidget {
  const AllRecipesScreen({super.key});

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

String username = "";
String password = "";

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('All Recipes'),
            leading: CupertinoButton(
              padding: const EdgeInsets.all(5),
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: ((context) {
                      return CupertinoAlertDialog(
                          title: Text('Sign In'),
                          content: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text("Don't have an account?"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: TextButton(
                                  child: Text("Register"),
                                  onPressed: () {
                                    context.pop();
                                    context.go("/signup");
                                  },
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            CupertinoTextFormFieldRow(
                              controller: usernameController,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              cursorColor: Color.fromARGB(255, 187, 35, 24),
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              placeholder: "Username",
                              placeholderStyle:
                                  TextStyle(color: Colors.black38),
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              decoration: BoxDecoration(
                                color: CupertinoColors.extraLightBackgroundGray,
                                border: Border.all(
                                  color:
                                      CupertinoColors.extraLightBackgroundGray,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please fill out this field";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                username = value!;
                              },
                            ),
                            CupertinoTextFormFieldRow(
                              controller: passwordController,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.next,
                              cursorColor: Color.fromARGB(255, 187, 35, 24),
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              placeholder: "Password",
                              placeholderStyle:
                                  TextStyle(color: Colors.black38),
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              decoration: BoxDecoration(
                                color: CupertinoColors.extraLightBackgroundGray,
                                border: Border.all(
                                  color:
                                      CupertinoColors.extraLightBackgroundGray,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please fill out this field";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                password = value!;
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Sign in'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              isDestructiveAction: true,
                            ),
                          ]);
                    })); // <----------- SIGN IN
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      // <------LOGIN
                      CupertinoIcons.person_crop_circle_fill,
                      size: 28,
                      color: Color.fromARGB(255, 187, 35, 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 187, 35, 24),
                        ),
                      ),
                    ),
                    // Icon(     // <----- LOGOUT
                    //   CupertinoIcons.person_crop_circle_fill,
                    //   size: 28,
                    //   color: Color.fromARGB(255, 187, 35, 24),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 5),
                    //   child: Text(
                    //     "logout",
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 187, 35, 24),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(5),
              onPressed: () {
                context.read<AuthProvider>().signup(
                    username: usernameController.text,
                    password: passwordController.text);
              },
              child: Icon(
                CupertinoIcons.plus,
                size: 27,
                color: Color.fromARGB(255, 187, 35, 24),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                if (context.watch<RecipesProvider>().isLoading)
                  LinearProgressIndicator()
                else
                  ...context
                      .watch<RecipesProvider>()
                      .recipes
                      .map((recipe) => RecipeListTile(
                            recipe: recipe,
                          ))
                      .toList(),

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

void main() {
  var cool_nums = [8, 9];
  var nums = [1, 2, ...cool_nums, 3, 4, 5];
}
