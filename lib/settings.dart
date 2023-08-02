import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Settings extends StatefulWidget {
  final String name;
  Settings(this.name);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            minVerticalPadding: 25,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
            ),
            title: Text(
              '${FirebaseAuth.instance.currentUser!.displayName.toString()}',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "Hey There I am Using ChatEase",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.key_sharp),
            title: Text('Account'),
            subtitle: Text('Security notifications , change password'),
            onTap: () {
              // Code to handle when the item is tapped
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy'),
            subtitle: Text('Block users'),
            onTap: () {
              // Code to handle when the item is tapped
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chats'),
            subtitle: Text('Theme , wallpapers , Chat History'),
            onTap: () {
              // Code to handle when the item is tapped
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications '),
            subtitle: Text('Theme , wallpapers , Chat History'),
            onTap: () {
              // Code to handle when the item is tapped
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}