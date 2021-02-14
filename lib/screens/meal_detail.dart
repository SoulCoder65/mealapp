import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//dummy data
import '../dummy_data.dart';

class MealDetail extends StatefulWidget {
  final Function _setFavouriteMeal;
  final Function _checkFavourite;
  MealDetail(this._setFavouriteMeal,this._checkFavourite);
  static const routeName="/MealDetail";

  @override
  _MealDetailState createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
    List<IconData> _icons = [
// The underscore declares a variable as private in dart.
    Icons.shopping_bag,
    Icons.workspaces_filled,
    Icons.check_circle_outline,
    Icons.cancel_outlined,
    Icons.favorite_rounded,
    Icons.favorite_outline_rounded,
  ];

  Widget _buildChip(BuildContext context, String label, Color color,int index) {
    return Container(
      margin: EdgeInsets.only(top: 6, bottom: 15,left: 5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Chip(
            avatar: Icon(
              _icons[index]
            ),
            labelPadding:
                EdgeInsets.only(left: 10, right: 10, top: 2.0, bottom: 2.0),
            label: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: color,
            elevation: 8.0,
            shadowColor: Colors.grey[60],
            padding: EdgeInsets.all(8.0),
          )
        ],
      ),
    );
  }

  Widget _boolChip(BuildContext context,String label, bool check) {
    final int index = check?2:3;
    final Color color=check?Colors.green:Colors.red;
    return Chip(

      labelPadding: EdgeInsets.all(2.0),
      avatar: Icon(
        _icons[index],
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 12.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String> ;
    final meal_info = DUMMY_MEALS.firstWhere((meal) => meal.id ==routeArgs['id']);
    int index=widget._checkFavourite(meal_info.id)?4:5;


    return Scaffold(

      appBar: AppBar(
        title: Text(meal_info.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              child: FadeInImage(
                image: NetworkImage(
                  meal_info.imageUrl,

                ),
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: AssetImage("assets/placeholder.jpg"),

              )

            ),

            //for ingredients tag
            _buildChip(context, "Ingredients", Colors.red,0),
            SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 2, color: Theme.of(context).accentColor))),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(right: 30),
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child: Row(
                              children: [
                                Icon(Icons.star_border_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    meal_info.ingredients[index],
                                    style: TextStyle(),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),

                              ],
                            ),

                          ),
                          Divider()
                        ],
                      );

                    },
                    itemCount: meal_info.ingredients.length,
                  )),
            ),

            //For procedure
            _buildChip(context, "Procedure", Colors.red,1),
            SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 2, color: Theme.of(context).accentColor))),
                  height: 170,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(right: 30),
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children:[ Center(
                          child: Row(

                            children: [
                              Icon(Icons.star_border_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  meal_info.steps[index],
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),

                        ),
                          Divider()
                        ]
                      );
                    },
                    itemCount: meal_info.steps.length,
                  )
              ),
            ),
            SizedBox(height: 16,),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                _boolChip(context, "Gluten Free",meal_info.isGlutenFree),
                _boolChip(context, "Lactose Free",meal_info.isLactoseFree),
                _boolChip(context, "Vegetarian",meal_info.isVegetarian),

              ],
            )
          ],
        ),

      ),

      floatingActionButton: new FloatingActionButton(
      child: Icon(_icons[index]),
        onPressed:() {
        setState(() {
          widget._checkFavourite(meal_info.id)?(index=5):(index=4);
        });

        widget._setFavouriteMeal(meal_info.id);

        },


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
