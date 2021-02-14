import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/dishes.dart';
import '../models/meal_model.dart';

class CardModel extends StatelessWidget {

  final String id;
  final String title;
  final Color color;
  final String imageUrl;
  CardModel(this.id, this.title, this.color, this.imageUrl);

  void OpenSpecificCategory(BuildContext context, String title, String id) {
    Navigator.pushNamed(context, DishesPage.routeName,
        arguments: {'title': title, 'id': id});
  }


  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
      elevation: 15,
      shadowColor: Colors.black,
      child: InkWell(
        onTap: () {
          OpenSpecificCategory(context, title, id);
        },
        splashColor: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
             border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.8)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),

                  borderRadius: BorderRadius.circular(18),

),

              ),
               ClipRRect(
                 child: Center(
                    child: Container(
                      color: Colors.black38,
                      width: double.infinity,
                      child: Text(
                        title,
                        style: GoogleFonts.getFont('Lato',
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    )),
               ),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(left: 5, top: 5),
    );
  }
}
