import 'package:flutter/material.dart';
import 'package:recipe_finder_app/model/recipe_model.dart';
import 'package:recipe_finder_app/service/recipe_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.keyWord});

  final String keyWord;
  static const String id = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String recipe;

  List<Recipe> _searchResults = [];

  void _performSearch(String searchQuery) async {
    try {
      final jsonResponse = await RecipeService().getSearchResult(searchQuery);
      setState(() {
        _searchResults = RecipeService().parseRecipes(jsonResponse);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
      _performSearch(widget.keyWord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_outlined),
              hintText: 'Search recipe',
            ),
            onChanged: (text) {
              recipe = text;
            },
            onSubmitted: (text) {
              _performSearch(text);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final recipe = _searchResults[index];
                return ListTile(
                  title: Text(recipe.name),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
