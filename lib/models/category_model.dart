import 'package:flutter/material.dart';

class Category {
  int? id;
  String title;
  String image;

  // static final List<Category> recipes = [
  //   Category(
  //       name: "Spaghetti Recipe",
  //       category: "Italian",
  //       description: "Penne",
  //       image:
  //           "https://supervalu.ie/thumbnail/1440x480/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg"),
  // ];

  Category({
    this.id,
    required this.title,
    required this.image,
  });
  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String,
        image = json['image'] as String;
}
