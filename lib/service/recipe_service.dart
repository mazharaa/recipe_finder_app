import 'package:recipe_finder_app/service/api_key.dart';
import 'package:recipe_finder_app/service/networking.dart';
import 'package:recipe_finder_app/model/recipe_model.dart';

const apiKey = appKey;
const apiId = appId;
const urlSearch = 'https://api.edamam.com/api/recipes/v2?type=public&q=';

class RecipeService {
  Future<dynamic> getSearchResult(String keyWord) async {
    NetworkHelper networking = NetworkHelper(
      '$urlSearch$keyWord&app_id=$apiId&app_key=%20$apiKey'
    );

    var searchData = await networking.getData();

    return searchData;
  }

  List<Recipe> parseRecipes(Map<String, dynamic> jsonResponse) {
    final List<dynamic> recipeList = jsonResponse['hits'];
    return recipeList.map((recipeData) {
      final List<dynamic> rawIngredients = recipeData['recipe']['ingredientLines'];
      final List<String> ingredients = rawIngredients.map((ingredient) =>
        ingredient.toString()).toList();

      return Recipe(
        name: recipeData['recipe']['label'],
        thumbnailUrl: recipeData['recipe']['images']['THUMBNAIL']['url'],
        ingredients: ingredients,
        instructions: recipeData['recipe']['url']
      );
    }).toList();
  }
}