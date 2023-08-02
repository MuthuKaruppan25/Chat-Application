import 'package:e_horizon/contacts.dart';
import 'package:e_horizon/group.dart';
import 'package:e_horizon/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Chat.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.displayName.toString();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          bottomNavigationBar: BottomAppBar(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.photo_camera),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.search),
              ),
              PopupMenuButton<int>(
                itemBuilder: (context) => [
                  // PopupMenuItem 1
                  PopupMenuItem(
                    value: 1,
                    // row with 2 children
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Get the App"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    // row with two children
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Settings")
                      ],
                    ),
                  ),
                  // PopupMenuItem 2
                  PopupMenuItem(
                    value: 3,
                    // row with two children
                    child: Row(
                      children: [
                        Icon(
                          Icons.chrome_reader_mode,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("About")
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    // row with two children
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("LogOut")
                      ],
                    ),
                  ),
                ],
                offset: Offset(0, 100),
                color: Color.fromARGB(250, 250, 250, 255),
                elevation: 2,
                // on selected we show the dialog box
                onSelected: (value) {
                  // if value 1 show dialog
                  if (value == 1) {
                    // if value 2 show dialog
                  } else if (value == 4) {
                    FirebaseAuth.instance.signOut();
                  }
                  else if( value==2){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(user)));
                  }
                },
              ),
            ],
            backgroundColor: Colors.blueAccent,
            titleSpacing: 30,
            title: Text(
              "ChatEase",
              style: GoogleFonts.julee(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            toolbarHeight: 80,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.chat),
                text: 'Chat',
              ),
              Tab(
                icon: Icon(Icons.whatshot),
                text: 'Group',
              ),

            ]),
          ),
          body: const TabBarView(children: [
            Chat(),
            Group(),
            // OD(),
            // Leave(),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Conatct()));
            },
            backgroundColor: Colors.pink,
            child: const Icon(
              Icons.sms,
              color: Colors.white,
            ),
          ),
        ));
  }
  Future signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}