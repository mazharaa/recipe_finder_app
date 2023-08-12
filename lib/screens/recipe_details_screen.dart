import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder_app/model/recipe_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Image.network(recipe.imageUrl)
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Ingredients'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = recipe.ingredients[index];
                return ListTile(
                  title: Text(ingredient),
                );
              }
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Instruction')
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'You can see the instructions '),
                    TextSpan(
                      text: 'here',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () async {
                        var url = Uri.parse(recipe.instructions);
                        if(await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw "Cannot load Url";
                        }
                      }
                    )
                  ]
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
