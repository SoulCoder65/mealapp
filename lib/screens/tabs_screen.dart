import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import '../screens/categories.dart';
import '../screens/favourites.dart';
import '../screens/filter.dart';
import '../models/meal_model.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/home";
  final List<Meal> _favouritesMeal;
  TabsScreen(this._favouritesMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Meal> availableMeals = DUMMY_MEALS;

  int _selectedIndex = 0;
  List<Widget> _screenOptions;

  @override
  void initState() {
    // TODO: implement initState
    _screenOptions =
        [
          Categories(),
          Favourites(widget._favouritesMeal),
        ];
    super.initState();
  }

  final List<Widget> _TitleName = [
    Text("Categories"),
    Text("Favourites"),
  ];
  //change screen function
  void _changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _TitleName[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Image.asset("assets/placeholder.jpg",fit: BoxFit.cover,)
            ),
            ListTile(
              leading: Icon(Icons.category_sharp),
              title: Text("Categories"),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Categories(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.sort_sharp),
              title: Text("Filter Dishes"),
              onTap: () {
                Navigator.pushNamed(context, FilterMeals.routeName);
              },
            )
          ],
        ),
      ),
      body: _screenOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _changeScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Categories",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: "Favourites")
        ],
      ),
    );
  }
}
