<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->


## Draw_Triangle

Make a countdown animation.


## Features

* Make a countdown animation
* Set seconds to countdown
* Set delay to countdown
* Set delay between two animating seconds (Regardless animation duration)
* Set animated switch duration of every second
* Set animation type (Scaling or fading)
* Set textstyle to digits
* Set a function to be called after countdown completed
* Eliminate zero digit after countdown completed


## Usage

```
  AnimatedCountDown countDown(){
    return AnimatedCountDown(
      userSeconds: 5,
      delayInitial: Duration(seconds: 10),
      delaySeconds: Duration(seconds: 1),
      animationDuration: Duration(seconds: 1),
      scaleTransition: false,
      textStyle: GoogleFonts.assistant(fontWeight:FontWeight.bold,fontSize: 100,color: Colors.purple),
      onCompleted: (){
          setState(() {
            print("Omer!");
          });
      },
      eliminate: false,
    );
  }
```




## Parameters

Here are the accepted parameters :


| Name  | Type | Default Value | Description | 
| ------------- | ------------- | ------------- | ------------- | 
| userSeconds  | int | null | Number of seconds to countdown | 
| delayInitial  | Duration | Duration(seconds: 3)  | Delay before countdown starts |
| delaySeconds  | Duration | Duration(seconds: 1)  | Delay between two animating seconds (Regardless animation duration) | 
| animationDuration  | Duration | Duration(seconds: 1)  | Animated switch's duration of every second| 
| scaleTransition  | bool | false | If true, animation type is scaling. Else, it is fading | 
| textStyle  | TextStyle | null | Function called after countdown completed | 
| onCompleted (Optional)  | VoidCallback | null | Triangle's side color | 
| eliminate  | bool | false | Eliminate zero digit after countdown completed | 



## example

<img src="assets/opac.gif" width="300" height="600">




