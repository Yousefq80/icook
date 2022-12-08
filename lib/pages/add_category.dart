import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:icook/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../providers/recipes_provider.dart';

class addCategory extends StatefulWidget {
  const addCategory({super.key});

  @override
  State<addCategory> createState() => _addCategoryState();
}

String title = "";
String image = "";

class _addCategoryState extends State<addCategory> {
  String title = "";
  final titleController = TextEditingController();
  File? imageFile;

  String? imageError;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Add a new Category',
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
                      placeholder: "Category title",
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
                    SizedBox(height: 10),
                    if (imageFile != null)
                      Image.file(
                        imageFile!,
                        width: 100,
                        height: 100,
                      )
                    else
                      Container(
                        width: 100,
                        height: 100,
                      ),
                    ElevatedButton(
                        onPressed: () async {
                          var file = await ImagePicker()
                              .getImage(source: ImageSource.gallery);

                          if (file == null) {
                            print("You didn't select a file");
                            return;
                          }

                          setState(() {
                            imageFile = File(file.path);
                            imageError = null;
                          });
                        },
                        child: Text("Add Image")),
                    if (imageError != null)
                      Text(
                        imageError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    Spacer(),
                    CupertinoButton(
                        color: Colors.green,
                        onPressed: () async {
                          // form

                          if (imageFile == null) {
                            setState(() {
                              imageError = "Required field";
                            });
                          }
                          if (formKey.currentState!.validate() &&
                              imageFile != null) {
                            await context.read<CategoryProvider>().addCategory(
                                  title: titleController.text,
                                  image: imageFile!,
                                );
                            context.pop();
                          }
                        },
                        child: Text("Add Category")

                        // SizedBox(height: 45),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     CupertinoButton(
                        //       color: Colors.green,
                        //       onPressed: () {
                        //         // if (formKey.currentState!.validate()) {
                        //         //   await context.read<RecipesProvider>().addRecipe(
                        //         //         title: titleController.text,
                        //         //         name: nameController.text,
                        //         //         category: categoryController.text,
                        //         //         description: descriptionController.text,
                        //         //         ingredients: ingredientsController.text,
                        //         //         instructions: instructionsController.text,
                        //         //         image: imageController.text,
                        //         //       );
                        //         // }
                        //         context.go("/list");
                        //       },
                        //       // },
                        //       child: Text('Add'),
                        //     ),
                        //     SizedBox(width: 25),
                        //     CupertinoButton(
                        //       color: Color.fromARGB(255, 187, 35, 24),
                        //       onPressed: () {
                        //         context.go("/list");
                        //       },
                        //       child: Text('Cancel'),
                        //     ),
                        //   ],
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
