import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  var _usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 250, 250, 255),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Receive an email to reset your password',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: TextFormField(
                    controller: _usernamecontroller,

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
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.7,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),

                        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                      ),

                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onPressed:resetPassword ,
                    ),
                  )),
            ],
          ),
        ),
      ),

    );
  }
  Future resetPassword()async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _usernamecontroller.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully email has been send"),
        ),
      );

    } on FirebaseAuthException catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.toString()}",style: GoogleFonts.poppins(color: Colors.red),),
        ),
      );
    }
  }
}
