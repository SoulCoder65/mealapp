import 'package:flutter/material.dart';
//import card model for categories
import '../templates/card_model.dart';
//getting dummy data
import '../dummy_data.dart';

class Categories extends StatelessWidget {
  static const routeName="/categories";

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage("assets/foodbg2.jpg",),fit: BoxFit.cover),
        ),
        child: Container(
          color: Colors.white38,
          padding: EdgeInsets.all(10),
          child: GridView(
            children: DUMMY_CATEGORIES
                .map((dt) => CardModel(dt.id, dt.title, dt.color,dt.imageUrl))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 3 / 2,
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20),
          ),
        ),
      );

  }
}
