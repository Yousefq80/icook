import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/recipes_provider.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({super.key});

  @override
  State<NewRecipe> createState() => _NewRecipeState();
}

String title = "";
String name = "";
String category = "";
String description = "";
String ingredients = "";
String instructions = "";
String image = "";

class _NewRecipeState extends State<NewRecipe> {
  String title = "";
  final titleController = TextEditingController();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final ingredientsController = TextEditingController();
  final instructionsController = TextEditingController();
  final imageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Add a Recipe',
          style: TextStyle(
            color: Color.fromARGB(255, 187, 35, 24),
            fontSize: 22,
          ),
        ),
      ),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    CupertinoTextFormFieldRow(
                      controller: titleController,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      placeholder: "Recipe title",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                      onSaved: (value) {
                        title = value!;
                      },
                    ),
                    CupertinoTextFormFieldRow(
                      controller: nameController,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      placeholder: "Author's name",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                        name = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    CupertinoTextFormFieldRow(
                      controller: categoryController,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      placeholder: "Category",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                        category = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    CupertinoTextFormFieldRow(
                      controller: descriptionController,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      textInputAction: TextInputAction.newline,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      placeholder: "Description",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                        description = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    CupertinoTextFormFieldRow(
                      controller: ingredientsController,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.words,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      textInputAction: TextInputAction.newline,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      placeholder: "Ingredients",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                        ingredients = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    CupertinoTextFormFieldRow(
                      controller: instructionsController,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 10,
                      textInputAction: TextInputAction.newline,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      placeholder: "Instructions",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                        instructions = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    CupertinoTextFormFieldRow(
                      controller: imageController,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      cursorColor: Color.fromARGB(255, 187, 35, 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      placeholder: "Image url",
                      placeholderStyle: TextStyle(color: Colors.black38),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        border: Border.all(
                          color: CupertinoColors.extraLightBackgroundGray,
                          width: 2,
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
                        image = value!;
                      },
                    ),
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          color: Colors.green,
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            //   await context.read<RecipesProvider>().addRecipe(
                            //         title: titleController.text,
                            //         name: nameController.text,
                            //         category: categoryController.text,
                            //         description: descriptionController.text,
                            //         ingredients: ingredientsController.text,
                            //         instructions: instructionsController.text,
                            //         image: imageController.text,
                            //       );
                            // }
                            context.go("/list");
                          },
                          // },
                          child: Text('Add'),
                        ),
                        SizedBox(width: 25),
                        CupertinoButton(
                          color: Color.fromARGB(255, 187, 35, 24),
                          onPressed: () {
                            context.go("/list");
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
