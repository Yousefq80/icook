import 'package:flutter/material.dart';

// class Recipe {
//   final String name;
//   final String author;
//   final String category;
//   final String? description;
//   final String image;

//   static final List<Recipe> recipes = [
//     Recipe(
//         name: "Spaghetti Recipe",
//         author: "John Pasta",
//         category: "Italian",
//         description: "Penne",
//         image:
//             "https://supervalu.ie/thumbnail/1440x480/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg"),
//   ];

//   Recipe({
//     required this.name,
//     required this.author,
//     required this.category,
//     this.description,
//     required this.image,
//   });
// }

// JSON READY MODEL BELOW
// ----------------------
//

class Recipe {
  int? id;
  String title;
  String user;
  String category;
  String description;
  String ingredients;
  String instructions;
  String image;

  Recipe(
      {this.id,
      required this.title,
      required this.user,
      required this.category,
      required this.description,
      required this.ingredients,
      required this.instructions,
      required this.image});

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String,
        user = json['user'] as String,
        category = json['category'] as String,
        description = json['description'] as String,
        ingredients = json['ingredients'] as String,
        instructions = json['instructions'] as String,
        image = json['image'] as String;
}
