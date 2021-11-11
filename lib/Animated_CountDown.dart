

import 'package:flutter/material.dart';
import 'dart:async';



class AnimatedCountDown extends StatefulWidget {

  //Number of seconds
  int userSeconds;

  //Delay before count down starts
  Duration delayInitial;

  //Delay between two animating seconds (Regardless animation duration)
  Duration delaySeconds;

  //Animated switch's duration of every second
  Duration animationDuration;

  //If true, animation type is scaling. Else, it is fading.
  bool scaleTransition;

  //TextStyle of digits
  TextStyle textStyle;

  //Function called after countdown completed
  VoidCallback? onCompleted;

  //Eliminate zero digit after countdown completed
  bool eliminate;


  AnimatedCountDown({
    required this.userSeconds,
    this.delayInitial=const Duration(seconds: 3),
    this.delaySeconds=const Duration(seconds: 1),
    this.animationDuration=const Duration(seconds: 1),
    this.scaleTransition=false,
    required this.textStyle,
    this.onCompleted,
    this.eliminate=false,
  });



  @override
  _AnimatedCountDownState createState() => _AnimatedCountDownState();
}

class _AnimatedCountDownState extends State<AnimatedCountDown> {


  //Calls a function after animation completed
  void _onCompleted() {
    if (widget.onCompleted != null)
      widget.onCompleted!();
  }

  //Whether animation completed or not
  bool isCompleted=false;

  @override
  initState(){

    //Time between the start of one animated second to the start of another animated second
    Duration time_space_between_two_seconds=widget.animationDuration+widget.delaySeconds;

    //Overall animated countdown time
    Duration totalAnimationTime=widget.delayInitial+time_space_between_two_seconds*(widget.userSeconds);

    var timerCompleted;
    for (Duration i = widget.delayInitial; i <= widget.delayInitial+time_space_between_two_seconds*(widget.userSeconds-1); i = i +time_space_between_two_seconds) {
      plus(i);
    }

    timerCompleted=Timer(totalAnimationTime, () {
      setState(() {
        _onCompleted();
        isCompleted=true;
      });
    });
  }

  var timer;
  plus(Duration duration){
    timer=Timer(duration, () {
      setState(() {
        widget.userSeconds-=1;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    if(isCompleted==true&&widget.eliminate==false){
      return Text("0",style: widget.textStyle,);
    }
    if(isCompleted==true&&widget.eliminate==true){
      return Container();
    }
    if(widget.scaleTransition==true){
      return Container(
        child: AnimatedSwitcher(
          duration: widget.animationDuration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            widget.userSeconds.toString(),
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(widget.userSeconds),
            style: widget.textStyle,
          ),
        ),
      );
    }else{
      return Container(
        child: AnimatedSwitcher(
          duration: widget.animationDuration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(child: child, opacity: animation);
          },
          child: Text(
            widget.userSeconds.toString(),
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(widget.userSeconds),
            style: widget.textStyle,
          ),
        ),
      );
    }


  }
}
