class Recipe {
  final String name;
  final String description;
  final List<String> ingredients;
  final String instructions;
  final String image; // Tambahkan field gambar

  Recipe({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.image, // Tambahkan di konstruktor
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: json['instructions'],
      image: json['image'], // Muat gambar dari JSON
    );
  }
}
