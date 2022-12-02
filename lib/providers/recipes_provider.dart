// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../models/recipes_model.dart';

// class RecipesProvider extends ChangeNotifier {
//   List<Recipe> recipes = [];
//   bool isLoading = true;

//   RecipesProvider() {
//     getRecipes();
//   }

//   Future<void> getRecipes() async {
//     isLoading = true;
//     notifyListeners();

//     recipes.clear();

//     // await a future (delay: 1 second)
//     // await Future.delayed(Duration(seconds: 1));

//     var response = await Client.dio.get("/recipes/");

//     var body = response.data as List;

//     recipes = body
//         .map(
//           (json) => Recipe.fromJson(json),
//         )
//         .toList();

//     isLoading = false;
//     notifyListeners();
//   }

//   Future<void> addRecipe({
//     required this.name,
//     required this.author,
//     required this.category,
//     this.description,
//     required this.image,
//   }) async {
//     await Client.dio.post("/recipes/",
//         data: FormData.fromMap({
//           "name": name,
//           "author": author,
//           "category": category,
//           "description": description,
//           "image": await MultipartFile.fromFile(image.path),
//         }));

//     getRecipes();
//   }

//   Future<void> editRecipe({
//     required Recipe recipe,
//     required String name,
//     required String author,
//     required String category,
//     String? description,
//     required File image,
//   }) async {
//     var client = Dio();

//     await client.put("/recipes/${recipe.id}",
//         data: FormData.fromMap({
//           "name": name,
//           "author": author,
//           "category": category,
//           "description": description,
//           "image": await MultipartFile.fromFile(image.path),
//         }));

//     getRecipes();
//   }

//   void deleteRecipe(int id) async {
//     await Client.dio.delete("/recipes/$id");

//     getRecipes();
//   }
// }
