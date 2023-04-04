// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => NavPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/splash.png"),
            height: 200,
            width: 400,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              "InScape",
              style:
                  GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "An Inside Labs Creation",
              style:
                  GoogleFonts.ubuntu(fontSize: 20, color: Colors.grey.shade600),
            ),
          )
        ],
      ),
    );
  }
}
