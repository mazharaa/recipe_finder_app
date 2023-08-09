import 'package:flutter/material.dart';
import 'package:recipe_finder_app/screens/search_screen.dart';

import '../service/recipe_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RecipeService recipeService = RecipeService();
  late String recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen(keyWord: text);
                }));
              },
            ),
            const Text('Featured recipe'),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Featured recipe 1'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Featured recipe 2'),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Featured recipe 3'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Featured recipe 4'),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Featured recipe 5'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Featured recipe 6'),
                )
              ],
            ),
            const Text('Categories'),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Recipe categories 1'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Recipe categories 2'),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Recipe categories 3'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Recipe categories 4'),
                )
              ],
            ),
            const Text('Saved recipe'),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Saved recipe 1'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Saved recipe 2'),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ]
      ),
    );
  }
}

// ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// itemCount: _searchResults.length,
// itemBuilder: (context, index) {
// final recipe = _searchResults[index];
// return ListTile(
// title: Text(recipe.name),
// );
// }
// ),