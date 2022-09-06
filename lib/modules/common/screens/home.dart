import "package:flutter/material.dart";
import 'package:smart/modules/layouts/screens/main.dart';
import 'package:smart/utils/helpers/hexcolor.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{

  Color mainColor = HexColor.fromHex("#5B5B5B");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      MainPage(
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container (
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 100,
                child: Container(
                  decoration: new BoxDecoration(
                    color: mainColor,
                    shape:
                    BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
          )
        ),
      )
    );
  }

}