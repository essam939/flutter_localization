import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'langProvider.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  LangProvider prlan;
  Splash({required this.prlan});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    widget.prlan.getPrefrence();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage(prlan: widget.prlan,))));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}