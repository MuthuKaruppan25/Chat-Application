

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_horizon/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  String _email = " ";
  String _pass="";
  String _cpass =" ";
  String s = " ";
  var _usernamecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();

  var _passwordcontroller = TextEditingController();

  var _cpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                color: Colors.redAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'ChatEase',
                style: GoogleFonts.poppins(
                    color: Colors.white,
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
                    color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextFormField(
                  controller:_usernamecontroller,

                  textInputAction: TextInputAction.next,
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
                      hintText: 'username'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email)=> email!= null && email.length<8
                      ?'Invalid username':null,

                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                child: TextFormField(
                  controller: _emailcontroller,

                  textInputAction: TextInputAction.next,
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
                      hintText: 'Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email)=> email!= null && !EmailValidator.validate(email)
                    ?'Enter a valid email':null,
                )),

            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  textInputAction: TextInputAction.next,
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
                      hintText: 'Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                   validator: (value)=>value!=null && value.length<6
                  ? 'Enter Minimum 6 Characters': null,
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: _cpasswordcontroller,
                  textInputAction: TextInputAction.done,
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
                      hintText: 'Confirm Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value)=>value!=_passwordcontroller.text ?'Please enter the same password': null,
                )),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 100),
                  child: Text(
                    "Already Have An Account ?",
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: TextButton(
                    child: Text("Login Here"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Login())));
                    },
                  ),
                ),
              ],
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
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: signUp,
                )),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 100),
              child: Row(
                children: [
                  Text(
                    "Developed by Goal Drivers",
                    style: GoogleFonts.poppins(color: Colors.white),

                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: 20),
            //       child: Image.asset('assets/gg.png'),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(top: 20),
            //       child: Image.asset('assets/apple.png'),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(top: 20),
            //       child: Image.asset('assets/fb.png'),
            //     ),
            //   ],
            // ),
          ]),
        ),
      ),
    );
   s = _usernamecontroller.text;
  }

  Future signUp() async {
  final isValid = _formkey.currentState!.validate();
  if(!isValid)return;
    try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _cpasswordcontroller.text.trim()

      );
     userCredential.user!.updateDisplayName(_usernamecontroller.text);

      if(ConnectionState.waiting==true)
        return Center(child: CircularProgressIndicator(),);
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      FirebaseFirestore fire = FirebaseFirestore.instance;

      await fire.collection('user').add({
        "name": _usernamecontroller.text,
        "email":_emailcontroller.text,
        
      }).then((docref) => docref.update({"chatID":docref.id}
      ));
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text("Successfully signed up",style: GoogleFonts.poppins(color: Colors.black),),
       ),
     );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));


    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.toString()}",style: GoogleFonts.poppins(color: Colors.red),),
        ),
      );
    }
  }

}