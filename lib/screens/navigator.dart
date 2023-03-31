// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/screens/chatpage.dart';
import 'package:mental/screens/communitypage.dart';
import 'package:mental/screens/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'musicpage.dart';

class NavPage extends StatefulWidget {
  int pageIndex;
  NavPage({required this.pageIndex, super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  dynamic username = TextEditingController(text: "User");
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Widget> widgetList = [
    HomePage(),
    CommunityPage(),
    ChatPage(),
    MusicPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: SafeArea(
            child: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage: AssetImage("assets/profile.png")),
                      ),
                      Text(
                        username.text,
                        style: GoogleFonts.ubuntu(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Uri url = Uri(
                                    scheme: "https",
                                    host: "insidelibrary.weebly.com");

                                if (!await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Row(children: [
                                Icon(
                                  Icons.info_rounded,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "About us",
                                    style: GoogleFonts.ubuntu(fontSize: 18),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20),
                        child: Column(
                          children: [
                            Row(children: [
                              Icon(
                                Icons.person,
                                size: 18,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: ExpansionTile(
                                      title: Text("Change Username",
                                          style:
                                              GoogleFonts.ubuntu(fontSize: 15)),
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(0),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                          child: TextField(
                                            controller: username,
                                            decoration: InputDecoration(
                                                hintText: "Username",
                                                hintStyle: GoogleFonts.ubuntu(),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 0.5,
                                                            color:
                                                                Colors.black))),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text(
                      "Made with ❤️",
                      style: GoogleFonts.ubuntu(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
          toolbarHeight: MediaQuery.of(context).size.height / 12,
          //backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                backgroundImage: AssetImage("assets/profile.png")),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, " + username.text + "!",
                  style: GoogleFonts.ubuntu(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  " Great to see you",
                  style: GoogleFonts.ubuntu(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.blue),
          currentIndex: widget.pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              widget.pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icon.png"),
                  size: 22,
                ),
                label: "Community"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: "Music"),
          ],
        ),
        body: Center(child: widgetList[widget.pageIndex]));
  }
}
