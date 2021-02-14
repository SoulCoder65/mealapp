import 'package:flutter/material.dart';
//tab view
import './screens/tabs_screen.dart';
import './screens/categories.dart';
import './screens/filter.dart';
import './screens/favourites.dart';
import './screens/dishes.dart';
import './screens/meal_detail.dart';
import 'models/meal_model.dart';
import './screens/welcome.dart';
//dummy data
import 'dummy_data.dart';
void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    "gluten":false,
    "vegetarian":false,
    "lactose":false,
  };
  //for filtering items
List<Meal> _availableMeals=DUMMY_MEALS;
  void _setFilters(Map<String,bool> filterData)
  {

    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree)
          {
            return false;
          }
        if(_filters['lactose'] && !meal.isLactoseFree)
        {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian)
        {
          return false;
        }
        return true;
      }).toList();

    }
    );
  }
  //<----------------------for filtering items End------------>
  //<-------------Adding item to favourites------------------>
  List<Meal> _favouritesMeal=[];
  void _setFavouriteMeal(String id) {

    final int checkData = _favouritesMeal.indexWhere((element) => element.id==id);
    if(checkData>=0)
      {
        _favouritesMeal.removeAt(checkData);
      }
    else{
      _favouritesMeal.add(DUMMY_MEALS.firstWhere((element) => element.id==id));
    }
    print(_favouritesMeal);
  }

  bool _checkFavourite(String id)
  {

    return _favouritesMeal.any((element) => element.id==id);
  }


  //<-------------Adding item to favourites END------------------>
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soul Meal",
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amberAccent
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(_favouritesMeal),
        WelcomeScreen.routeName:(context)=>WelcomeScreen(),

        DishesPage.routeName: (context) => DishesPage(_availableMeals),
        MealDetail.routeName: (context) => MealDetail(_setFavouriteMeal,_checkFavourite),
        FilterMeals.routeName: (context) => FilterMeals(_filters,_setFilters),


      },
    );

    //ss
  }
}