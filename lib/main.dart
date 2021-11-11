import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Animated_CountDown.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child:animatedCountDown())
        ));
  }

  animatedCountDown(){
      return AnimatedCountDown(
        userSeconds: 5,
        delayInitial: Duration(seconds: 5),
        delaySeconds: Duration(seconds: 1),
        animationDuration: Duration(seconds: 1),
        scaleTransition: false,
        textStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 100,color: Colors.purple),
        onCompleted: (){
            print("Finished!");
        },
        eliminate: false,
      );

  }



}