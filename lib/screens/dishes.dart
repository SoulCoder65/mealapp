import 'package:flutter/material.dart';
import '../dummy_data.dart';
//meal card template
import '../templates/meal_card.dart';
import '../models/meal_model.dart';

class DishesPage extends StatefulWidget {
  static const routeName="/DishesPage";
  final List<Meal> availableMeals;
  DishesPage(this.availableMeals);
  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {

  @override
  Widget build(BuildContext context) {

    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(routeArgs["id"]);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs["title"]),
      ),
       body: ListView.builder(
        itemBuilder: (context, index) {
          return MealCard(
            categoryMeals[index].id,
              categoryMeals[index].title,
              categoryMeals[index].imageUrl,
              categoryMeals[index].duration,
              categoryMeals[index].affordability,
              categoryMeals[index].complexity);
        },
        itemCount: categoryMeals.length,
       ),

    );
  }
}
