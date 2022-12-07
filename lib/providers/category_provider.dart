import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../client.dart';
import '../models/category_model.dart';
import '../models/recipes_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> category = [];

  bool isLoading = true;

  CategoryProvider() {
    getCategory();
  }

  Future<void> getCategory() async {
    try {
      isLoading = true;
      notifyListeners();

      category.clear();

      // await a future (delay: 1 second)
      // await Future.delayed(Duration(seconds: 1));

      var response = await Client.dio.get("/api/categories/");
      var body = response.data as List;

      category = body
          .map(
            (json) => Category.fromJson(json),
          )
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
