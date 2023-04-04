import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalChat extends StatefulWidget {
  const PersonalChat({super.key});

  @override
  State<PersonalChat> createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Messages will appear here!",
          style: GoogleFonts.ubuntu(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
