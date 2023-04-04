// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/screens/chatpage.dart';
import 'package:mental/screens/communitypage.dart';
import 'package:mental/screens/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'musicpage.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _pageIndex = 0;
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
        drawer: Container(
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
          backgroundColor: Colors.transparent,
          toolbarHeight: MediaQuery.of(context).size.height / 14,
          //backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              )),
          title: Text(
            (_pageIndex == 0)
                ? "InScape"
                : (_pageIndex == 1)
                    ? "Community"
                    : (_pageIndex == 2)
                        ? "Chat"
                        : (_pageIndex == 3)
                            ? "Music"
                            : ("InScape"),
            style: GoogleFonts.ubuntu(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 25), label: "Home"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icon.png"), size: 25),
                label: "Community"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat, size: 25), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music, size: 25), label: "Music"),
          ],
        ),
        body: Center(child: widgetList[_pageIndex]));
  }
}
