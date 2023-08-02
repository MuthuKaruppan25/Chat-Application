import 'package:e_horizon/list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:badges/badges.dart';

class Conatct extends StatefulWidget {
  const Conatct({super.key});

  @override
  State<Conatct> createState() => _ConatctState();
}

class _ConatctState extends State<Conatct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Select Conatct",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          Icon(Icons.search),
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
                    Text("Invite a")
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
              } else if (value == 4) {}
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something Went Wrong"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  final QueryDocumentSnapshot doc = snapshot.data!.docs[index];
                  final Lister list =
                  Lister(name: doc["name"], email: doc["email"],chatid: doc["chatID"]);
                  return ListTile(
                    minVerticalPadding: 25,
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                    ),
                    title: Text(
                      list.name,
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    // onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: ((context) => user())));
                    // },
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Hey there! I am using ChatEase",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                })),
          );
        },
      ),
    );
  }
}