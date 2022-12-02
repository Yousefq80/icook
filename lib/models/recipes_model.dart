import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final String author;
  final String category;
  final String? description;
  final String image;

  static final List<Recipe> recipes = [
    Recipe(
        name: "Spaghetti Recipe",
        author: "John Pasta",
        category: "Italian",
        description: "Penne",
        image:
            "https://supervalu.ie/thumbnail/1440x480/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg"),
  ];

  Recipe({
    required this.name,
    required this.author,
    required this.category,
    this.description,
    required this.image,
  });
}



// JSON READY MODEL BELOW
// ----------------------
// 

// class Recipe {
//   int? id;
//   String name;
//   String author;
//   String category;
//   String description;
//   String image;


//   Recipe(
//       {this.id,
//       required this.name,
//       required this.author,
//       required this.category,
//       required this.description,
//       required this.image});

//   Recipe.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as int?,
//         name = json['name'] as String,
//         author = json['author'] as String,
//         category = json['category'] as String,
//         description = json['description'] as String,
//         image = json['image'] as String;
// }
