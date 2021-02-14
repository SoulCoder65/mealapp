import 'package:flutter/material.dart';
class FilterMeals extends StatefulWidget {
  static const routeName="/filterMeal";
  final Function saveFilters;
  final Map<String,bool> _filterMeals;
  FilterMeals(this._filterMeals,this.saveFilters);
  @override
  _FilterMealsState createState() => _FilterMealsState();
}

class _FilterMealsState extends State<FilterMeals> {

  Map<String,bool> filterValues={
    "gluten":false,
    "vegetarian":false,
    "lactose":false,
  };

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      filterValues=widget._filterMeals;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Dishes"),

      ),
      body:Container(
          padding: EdgeInsets.only(left: 50),
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.all(15),
              title: Text("Gluten Free",style: TextStyle(
                color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              subtitle: Text("Includes Only Gluten Free Dishes"),
              value: filterValues["gluten"], onChanged: (value) {
                setState(() {
                  filterValues["gluten"]=value;
                });
              },),
              SwitchListTile(
                contentPadding: EdgeInsets.all(15),
                  title: Text("Vegetarian",style: TextStyle(
                      color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  subtitle: Text("Includes Only Vegetarian Dishes"),
                  value: filterValues["vegetarian"], onChanged: (value) {
                    setState(() {
                      filterValues["vegetarian"]=value;
                    });
                  },),
              SwitchListTile(
                contentPadding: EdgeInsets.all(15),
                  title: Text("Lactose Free",style: TextStyle(
                      color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  subtitle: Text("Includes Only Lactose Free Dishes"),
                  value: filterValues["lactose"], onChanged: (value) {
                    setState(() {
                      filterValues["lactose"]=value;
                    });
                  },
              ),
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(onPressed: () {
                    widget.saveFilters(filterValues);
                  },child: Icon(Icons.save),)

                ],
              ),
            )
            ],
          )

      ),
       
    );
  }
}
