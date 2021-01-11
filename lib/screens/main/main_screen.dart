import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(60, 32, 189, 0.91),
              Color.fromRGBO(60, 38, 223, 0.71)
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are not yet Vaccinated from Covid',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 43,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )
                )
              ),
              SizedBox(height: 32),
              Icon(Icons.block, color: Colors.white, size: 97),
              SizedBox(height: 32),
              Container(
                height: 50.0,
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/injection');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.lightGreen.shade200],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                      BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Get Vaccinated",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        )
      ),
    );
  }
}