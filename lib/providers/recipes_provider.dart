import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../client.dart';
import '../models/category_model.dart';
import '../models/recipes_model.dart';

class RecipesProvider extends ChangeNotifier {
  List<Recipe> recipes = [];

  bool isLoading = true;

  RecipesProvider() {
    getRecipes();
  }

  Future<void> getRecipes() async {
    try {
      isLoading = true;
      notifyListeners();

      recipes.clear();

      // await a future (delay: 1 second)
      // await Future.delayed(Duration(seconds: 1));

      var response = await Client.dio.get("/api/recipes/");

      var body = response.data as List;

      recipes = body
          .map(
            (json) => Recipe.fromJson(json),
          )
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void deleteRecipe(int id) async {
    await Client.dio.delete("/pets/$id");

    getRecipes();
  }

  // Future<void> addRecipe({
  //   required this.title,
  //   required this.name,
  //   required this.category,
  //   this.description,
  //   required this.ingredients,
  //   required this.instructions,
  //   required this.image,
  // }) async {
  //   await Client.dio.post("/api/recipes/",
  //       data: FormData.fromMap({
  //         "title": title,
  //         "name": name,
  //         "category": category,
  //         "description": description,
  //         "ingredients": ingredients,
  //         "instructions": instructions,
  //         "image": image,
  //       }));

  //   getRecipes();
  // }

  Future<void> editRecipe({
    required Recipe recipe,
    required String title,
    required String user,
    required String category,
    String? description,
    required String ingredients,
    required String instructions,
    required String image,
  }) async {
    var client = Dio();

    await client.put("/recipes/${recipe.id}",
        data: FormData.fromMap({
          "title": title,
          "user": user,
          "category": category,
          "description": description,
          "ingredients": ingredients,
          "instructions": instructions,
          "image": image,
        }));

    getRecipes();
  }

  // void deleteRecipe(int id) async {
  //   await Client.dio.delete("/recipes/$id");

  //   getRecipes();
  // }
}
