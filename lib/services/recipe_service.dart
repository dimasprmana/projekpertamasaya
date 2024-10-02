import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:aplikasipertamasaya/models/recipe.dart';

class RecipeService {
  static Future<List<Recipe>> loadRecipes() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Recipe.fromJson(json)).toList();
  }
}
