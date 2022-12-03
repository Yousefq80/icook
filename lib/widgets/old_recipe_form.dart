import 'dart:io';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class NewRecipeForm extends StatefulWidget {
  const NewRecipeForm({super.key});

  @override
  State<NewRecipeForm> createState() => NewRecipeFormState();
}

String name = "";
String author = "";
String category = "";
String description = "";
String image = "";

// var _image;
// final _picker = ImagePicker();

class NewRecipeFormState extends State<NewRecipeForm> {
  final nameController = TextEditingController();
  final authorController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Dish's name",
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
          TextFormField(
            controller: authorController,
            decoration: const InputDecoration(
              hintText: "Your name",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out this field";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              author = value!;
            },
          ),
          TextFormField(
            controller: categoryController,
            decoration: const InputDecoration(
              hintText: "Type of cuisine",
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () async {
          //             final XFile? image =
          //                 await _picker.pickImage(source: ImageSource.gallery);
          //             setState(() {
          //               _image = File(image!.path);
          //             });
          //           },
          //           child: Container(
          //             width: 100,
          //             height: 100,
          //             margin: const EdgeInsets.only(top: 20),
          //             // decoration: BoxDecoration(color: Colors.blue[200]),
          //             child: _image != null
          //                 ? Image.file(
          //                     _image,
          //                     width: 200.0,
          //                     height: 200.0,
          //                     fit: BoxFit.fitHeight,
          //                   )
          //                 : Container(
          //                     // decoration:
          //                     //     BoxDecoration(color: Colors.blue[200]),
          //                     width: 200,
          //                     height: 200,
          //                     child: Icon(
          //                       Icons.camera_alt,
          //                       color: Colors.blueGrey,
          //                       size: 75,
          //                     ),
          //                   ),
          //           ),
          //         ),
          //         const Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Text("Select an image"),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // if (formKey.currentState!.validate()) {
                  //   await context.read<RecipesProvider>().addPets(
                  //         name: nameController.text,
                  //         author: authorController.text,
                  //         category: categoryController.text,
                  //         description: descriptionController.text,
                  //         image: imageController.text,
                  //         // image: _image!,
                  //       ); // CHECK
                  //   context.pop();
                  // }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
