import 'package:flutter/material.dart';
import 'package:aplikasipertamasaya/widgets/recipe_card.dart';
import 'package:aplikasipertamasaya/services/recipe_service.dart';
import 'recipe_detail_screen.dart';
import 'package:aplikasipertamasaya/models/recipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Recipe>> _recipeList;

  @override
  void initState() {
    super.initState();
    _recipeList = RecipeService.loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Resep Makanan'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: _recipeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan!'));
          } else if (snapshot.hasData) {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: recipes[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe: recipes[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Tidak ada resep'));
          }
        },
      ),
    );
  }
}
