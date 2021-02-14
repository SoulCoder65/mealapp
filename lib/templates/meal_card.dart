import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';

//for meal detail
import '../screens/meal_detail.dart';
class MealCard extends StatelessWidget {
  final String id;
  final String title;
  final String ImgUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  MealCard(this.id,this.title, this.ImgUrl, this.duration, this.affordability,
      this.complexity);

  //getter for affordability and complexity
  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
      default:
        return "Not Known";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Costly:
        return "Costly";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Not Known";
    }
  }

  //Show meal detail function
  void showMealDetail(BuildContext context,String id,String title)
  {
    Navigator.pushNamed(context,MealDetail.routeName,arguments: {'id':id,'title':title});
    }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: InkWell(
        onTap: () {
        showMealDetail(context,id,title);
        },
        splashColor: Colors.white38,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                child: Image.network(
                  ImgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 190,
                  left: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.98,
                    height: 30,
                    color: Colors.black38,
                    child: Center(
                        child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                      letterSpacing:3),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    )),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.watch_later_sharp),
                    Text(
                      '${duration.toString()} mins',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.fastfood_sharp),
                    Text(
                      complexityText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.monetization_on),
                    Text(
                      affordabilityText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
