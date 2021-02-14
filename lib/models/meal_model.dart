//for checking how hard is to prepare that dish
enum Complexity { Simple, Challenging, Hard }

//check afford or not
enum Affordability { Affordable, Costly, Luxurious }

//Meal Structure
class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
  {
      this.id,
      this.categories,
      this.title,
      this.imageUrl,
      this.ingredients,
      this.steps,
      this.duration,
      this.complexity,
      this.affordability,
      this.isGlutenFree,
      this.isLactoseFree,
      this.isVegan,
      this.isVegetarian}
      );
}

