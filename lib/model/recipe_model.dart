class Recipe {
  final String name;
  final String thumbnailUrl;
  final List<String> ingredients;
  final String instructions;
  final String imageUrl;

  Recipe({
    required this.name,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.instructions,
    required this.imageUrl
  });
}