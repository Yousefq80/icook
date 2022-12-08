import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icook/pages/new_recipe_screen.dart';
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
            largeTitle: Row(
              children: [
                Text('All Recipes'),
                CupertinoButton(
                  padding: const EdgeInsets.all(5),
                  onPressed: () {
                    // context.read<AuthProvider>().signup(
                    //     username: usernameController.text,
                    //     password: passwordController.text);

                    context.push('/search');
                  },
                  child: Icon(
                    CupertinoIcons.search,
                    size: 27,
                    color: Color.fromARGB(255, 187, 35, 24),
                  ),
                ),
              ],
            ),
            leading: CupertinoButton(
              padding: const EdgeInsets.all(5),
              onPressed: () {
                //*   if(context.)

                showCupertinoDialog(
                    context: context,
                    builder: ((context) {
                      return CupertinoAlertDialog(
                          title: Text('Sign In'),
                          content: Form(
                            child: Column(
                              children: [
                                Text("Don't have an account?"),
                                TextButton(
                                  child: Text("Register here"),
                                  onPressed: () {
                                    context.pop();
                                    context.push("/signup");
                                  },
                                ),
                              ],
                            ),
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
                            SizedBox(height: 25),
                            CupertinoDialogAction(
                              child: Text('Sign in'),
                              onPressed: () async {
                                context.read<AuthProvider>().login(
                                    //!  To Work on
                                    username: usernameController.text,
                                    password: passwordController.text);
                                context.pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('Cancel'),
                              onPressed: () {
                                context.pop();
                              },
                              isDestructiveAction: true,
                            ),
                          ]);
                    })); // <----------- SIGN IN
              },
              child: context.watch<AuthProvider>().username == null
                  ? Padding(
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
                            padding: const EdgeInsets.only(left: 1),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 187, 35, 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        Icon(
                          // <----- LOGOUT
                          CupertinoIcons.person_crop_circle_fill,
                          size: 28,
                          color: Color.fromARGB(255, 187, 35, 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "logout",
                            style: TextStyle(
                              color: Color.fromARGB(255, 187, 35, 24),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(5),
              onPressed: () {
                // context.read<AuthProvider>().signup(
                //     username: usernameController.text,
                //     password: passwordController.text);

                context.go('/add');
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
