// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 25, left: 10, right: 10),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(250, 170, 159, 0.2),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage("assets/music.png"),
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ProgressBar(
                thumbGlowRadius: 20,
                baseBarColor: Colors.white,
                progressBarColor: Colors.grey,
                bufferedBarColor: Colors.grey.shade50,
                thumbColor: Colors.grey.shade700,
                progress: Duration(milliseconds: 1000),
                buffered: Duration(milliseconds: 2000),
                total: Duration(milliseconds: 5000),
                onSeek: (duration) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                children: [
                  Text(
                    "Relax! 44HZ",
                    style: GoogleFonts.ubuntu(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 80,
                        ),
                        Icon(Icons.play_circle_filled_outlined,
                            color: Colors.white, size: 80),
                        Icon(Icons.skip_next, color: Colors.white, size: 80)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
