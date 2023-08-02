import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_horizon/currentuser.dart';
import 'package:e_horizon/list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'User.dart';

class Chat extends StatefulWidget  {

  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override
  Widget build(BuildContext context) {
    String s = FirebaseAuth.instance.currentUser!.displayName.toString();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('user').where('name',isNotEqualTo: s).snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Center(child: Text("Something went wrong"),);
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                final QueryDocumentSnapshot doc = snapshot.data!.docs[index];
                // final Lister list = Lister(
                //     name: doc["name"]as String,
                //     email: doc["email"]as String,
                //     chatid: doc["chatID"]as String,
                // );
                final Lister list =Lister.fromSnapshot(doc);
                CurrentUser(name: list.name);
                return ListTile(
                minVerticalPadding: 25,
                leading: Badge(
                  badgeContent: Text("3"),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/1398385367/photo/happy-millennial-business-woman-in-glasses-posing-with-hands-folded.jpg?b=1&s=170667a&w=0&k=20&c=YaXYAUQu3wpM2xiFJgorwMvK5pNnrrdnFeHd1lTVwCs='),
                  ),
                ),
                trailing: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("12:30 PM")),
                title: Text(list.name,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () {
                 Navigator.of(context).pushNamed(Userr.routename,arguments: list.chatid);

                },
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Hey there I am using ChatEase",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );}));

        },
      ),
    );
  }

}
