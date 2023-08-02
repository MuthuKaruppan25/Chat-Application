import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_horizon/forgotpass.dart';
import 'package:e_horizon/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  var _usernamecontroller = TextEditingController();

  var _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 250, 250, 255),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Icon(
                Icons.forum,
                size: 100,
                color: Colors.blueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'ChatEase',
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Communication made simple and easy',
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email)=> email!= null && !EmailValidator.validate(email)
                      ?'Enter a valid email':null,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)=>value!=null && value.length<6
                      ? 'Enter Minimum 6 Characters': null,
                )),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 230),
              child: TextButton(
                child: Text("Forgot Password ?"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: Text(
                    'Log In',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: signIn,
                )),
            Padding(
              padding: EdgeInsets.only(top: 70, left: 100),
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
      ),

    );

  }

  Future signIn() async {
    final isValid = _formkey.currentState!.validate();
    if(!isValid)return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _usernamecontroller.text.trim(),
          password: _passwordcontroller.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully signed in",style: GoogleFonts.poppins(color: Colors.black)),

        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));

    }on FirebaseAuthException catch(e)
    {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.toString()}",style: GoogleFonts.poppins(color: Colors.red)),

        ),
      );
    }
  }
}