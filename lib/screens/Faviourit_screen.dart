import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
final List favoriteMeal;

  const FavoritesScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
        child: Text("you haven't any favorite meal add them"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index]. id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
