import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';

class SplashScreen extends StatefulWidget{

  State<StatefulWidget> createState() =>InitState();
}

class InitState extends State<SplashScreen>{
  @override
  void initState() {
    Timer(Duration(seconds: 5), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen())));
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Container(
          child: Center(
               child: Container(
                height: 200,
                 alignment:Alignment.center,
                 child: Image.asset("assets/v_logo.png"),
               ),
           ),
       ),
   );
  }
}

