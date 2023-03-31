// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'communitypage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              child: Text(
                "Welcome User!",
                style: GoogleFonts.ubuntu(fontSize: 22, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, top: 30),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 109, 89, 0.24),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "Thought of the day!",
                        style: GoogleFonts.ubuntu(fontSize: 26),
                      ),
                    ),
                    Image(image: AssetImage("assets/thought.png"))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 40),
              child: Text(
                "How are you feeling today?",
                style: GoogleFonts.ubuntu(fontSize: 22, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 109, 89, 0.24)),
                      child: Image(
                        image: AssetImage("assets/smile.png"),
                      )),
                  Container(
                      padding: EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 109, 89, 0.24)),
                      child: Image(
                        image: AssetImage("assets/confused.png"),
                      )),
                  Container(
                      padding: EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 109, 89, 0.24)),
                      child: Image(
                        image: AssetImage("assets/angry.png"),
                      )),
                  Container(
                      padding: EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 109, 89, 0.24)),
                      child: Image(
                        image: AssetImage("assets/sad.png"),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "Explore",
                style: GoogleFonts.ubuntu(fontSize: 22, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 170, 159, 0.33),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Heal through music!",
                            style: GoogleFonts.ubuntu(fontSize: 26),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 170, 159, 0.33),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "Talk to the community!",
                            style: GoogleFonts.ubuntu(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
