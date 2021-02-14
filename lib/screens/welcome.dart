import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'tabs_screen.dart';

//WELCOME SCREEN WIDGET
class WelcomeScreen extends StatefulWidget {
  static const routeName="/welcome";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  //AFTER 4 SEC REDIRECT TO SELECT QUIZ PAGE
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer timer=new Timer(Duration(seconds: 3),()=>{
      Navigator.pushNamed(context, TabsScreen.routeName),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/foodbg2.jpg"),
            fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Welcome To Soul Meals",style:GoogleFonts.getFont('Oswald',
                    textStyle: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                    shadows: [
                      Shadow(
                          color: Colors.deepPurple,
                          blurRadius: 10.0,
                          offset: Offset(5.0,5.0)
                      )
                    ]
                ),
                ),
                SizedBox(height: 40,),
                Container(
                  child: SpinKitChasingDots(color: Colors.white,size: 70,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
