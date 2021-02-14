import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../templates/meal_card.dart';
class Favourites extends StatelessWidget {
  final List<Meal> _favouritesMeal;
  Favourites(this._favouritesMeal);
  static const routeName="/favouritesMeal";
  @override
  Widget build(BuildContext context) {
    return _favouritesMeal.length<=0?Center(
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/favourite_placeholder.png"),
            Text("No favourite Meal",style: TextStyle(
              fontSize: 30,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold)
            ),
            Text("-Start Adding Some!!",style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),)

          ],
        ),
      ),
    ):Center(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MealCard(
              _favouritesMeal[index].id,
              _favouritesMeal[index].title,
              _favouritesMeal[index].imageUrl,
              _favouritesMeal[index].duration,
              _favouritesMeal[index].affordability,
              _favouritesMeal[index].complexity);
        },
        itemCount: _favouritesMeal.length,
      ),
    );
  }
}
