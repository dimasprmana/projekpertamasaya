import 'package:flutter/material.dart';
import 'package:aplikasipertamasaya/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar perangkat
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name), // Menampilkan nama resep sebagai judul
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar dengan ukuran yang disesuaikan
              Image.asset(
                recipe.image,
                width: screenWidth * 0.8,  // 80% dari lebar layar
                height: screenWidth * 0.5, // 50% dari lebar layar
                fit: BoxFit.cover, // Menjaga proporsi gambar
              ),
              SizedBox(height: 20),
              Text(
                recipe.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Deskripsi:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(recipe.description),
              SizedBox(height: 20),
              Text(
                'Bahan-bahan:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...recipe.ingredients
                  .map((ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('- $ingredient'),
                      ))
                  .toList(),
              SizedBox(height: 20),
              Text(
                'Instruksi:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(recipe.instructions),
            ],
          ),
        ),
      ),
    );
  }
}
