
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signin.dart';
import 'SignUp.dart';
import 'package:google_fonts/google_fonts.dart';
class Start extends StatelessWidget {
  Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 250, 250, 255),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
            ),
            child: Icon(Icons.forum, size: 100, color: Colors.blueAccent),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'ChatEase',
              style: GoogleFonts.poppins(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0,
            ),
            child: Text(
              " Bringing people closer, one chat at a time",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 100),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      top: 15, bottom: 15, right: 130, left: 130)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Text(
                  'LOG IN',
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Login())));
                },
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      top: 15, bottom: 15, right: 130, left: 130)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blueAccent,
                  ),
                ),
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SignUp())));
                },
              )),
          Padding(
            padding: EdgeInsets.only(top: 100, left: 100),
            child: Row(
              children: [
                Text(
                  "Developed by Goal Drivers",
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}