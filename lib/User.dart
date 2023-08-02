

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_horizon/currentuser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'chatmodēl.dart';

class Userr extends StatefulWidget {
  static const String routename = '/userr_screen';
  const Userr({super.key});

  @override
  State<Userr> createState() => _UserrState();
}

class _UserrState extends State<Userr> {
  final String currid = FirebaseAuth.instance.currentUser!.uid;
   XFile? xFile;
    String chatID=" ";
  late String imageurl="";
  FilePickerResult? result;
  @override
  var _messagecontroller = TextEditingController();
  Widget build(BuildContext context){

    chatID = ModalRoute.of(context)!.settings.arguments as String;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(250, 250, 250, 255),
          bottomNavigationBar: BottomAppBar(),
          appBar: AppBar(
            leading: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.videocam),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.call),
              ),
            ],
            backgroundColor: Colors.blueAccent,
            titleSpacing: 30,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mano Sundar M',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Online",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            toolbarHeight: 80,
          ),
    body: StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection('user').doc(chatID).collection('chat').snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong"),);
        }
        if(snapshot.hasData){
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final QueryDocumentSnapshot doc = snapshot.data!
                          .docs[index];
                      // final Chatmodel chatmodel = Chatmodel(
                      //     message: doc["message"] as String,
                      //     timestamp: doc["timestamp"] as Timestamp,
                      //     userid: doc["userID"] as String,
                      //     username: doc["username"] as String
                      // );
                      final Chatmodel chatmodel = Chatmodel.fromSnapshot(doc);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: chatmodel.userid == currid ? Alignment
                              .centerRight : Alignment.centerLeft,
                          child: GestureDetector(
                            onLongPress: () async {
                              Bi(chatmodel.docid);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 118, 19, 224),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: chatmodel.userid == currid
                                      ? const Radius.circular(15)
                                      : Radius.zero,
                                  bottomRight: chatmodel.userid == currid
                                      ? Radius.zero
                                      : const Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: chatmodel.userid == currid
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(chatmodel.message,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16, color: Colors.white,),),
                                  if(chatmodel.imageurl.isNotEmpty)
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 5),
                                      ),
                                      child: Image.network(chatmodel.imageurl),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 18),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Colors.grey[700],
                  child: Row(children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     PopupMenuButton<int>(
                    //       itemBuilder: (context) => [
                    //         // PopupMenuItem 1
                    //         PopupMenuItem(
                    //           value: 1,
                    //           // row with 2 children
                    //           child: Row(
                    //             children: [
                    //               Icon(
                    //                 Icons.star,
                    //                 color: Colors.black,
                    //               ),
                    //               SizedBox(
                    //                 width: 10,
                    //               ),
                    //               Text("Get The App")
                    //             ],
                    //           ),
                    //         ),
                    //         PopupMenuItem(
                    //           value: 2,
                    //           // row with two children
                    //           child: Row(
                    //             children: [
                    //               Icon(
                    //                 Icons.settings,
                    //                 color: Colors.black,
                    //               ),
                    //               SizedBox(
                    //                 width: 10,
                    //               ),
                    //               Text("Settings")
                    //             ],
                    //           ),
                    //         ),
                    //         // PopupMenuItem 2
                    //         PopupMenuItem(
                    //           value: 3,
                    //           // row with two children
                    //           child: Row(
                    //             children: [
                    //               Icon(
                    //                 Icons.chrome_reader_mode,
                    //                 color: Colors.black,
                    //               ),
                    //               SizedBox(
                    //                 width: 10,
                    //               ),
                    //               Text("About")
                    //             ],
                    //           ),
                    //         ),
                    //         PopupMenuItem(
                    //           value: 4,
                    //           // row with two children
                    //           child: Row(
                    //             children: [
                    //               Icon(
                    //                 Icons.logout,
                    //                 color: Colors.black,
                    //               ),
                    //               SizedBox(
                    //                 width: 10,
                    //               ),
                    //               Text("LogOut")
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //       offset: Offset(0, 100),
                    //       color: Color.fromARGB(250, 250, 250, 255),
                    //       elevation: 2,
                    //       // on selected we show the dialog box
                    //       onSelected: (value) {
                    //         // if value 1 show dialog
                    //         if (value == 1) {
                    //           // if value 2 show dialog
                    //         } else if (value == 4) {
                    //
                    //         }
                    //       },
                    //     );
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //       color: Theme.of(context).primaryColor,
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: const Center(
                    //         child: Icon(
                    //           Icons.collections,
                    //           color: Colors.white,
                    //         )),
                    //   ),
                    // ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.collections),
                          onPressed: () {
                            Bo();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                          controller: _messagecontroller,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Send a message...",
                            hintStyle: TextStyle(
                                color: Colors.white, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        )),

                    GestureDetector(
                      onTap: () {
                        if (_messagecontroller.text.isNotEmpty) {
                          sendmess();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ]),
                ),
              ),

            ],
          );
        }
        return Center(child: CircularProgressIndicator(),);
      }
    ),
        ),
    );
  }
 Future send()async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

 }
 Future<void> Bo(){
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) => SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _handleImageSelection();
                  },
                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    PlatformFile? pickedfile;
                    result = await FilePicker.platform.pickFiles();
                    if(result!=null)
                    {
                      setState(() {
                        pickedfile = result!.files.first;
                      });
                      result?.files.forEach((element) {print(element.name);});
                    }
                    else{
                      print("No file selected");
                    }
                    File file = File(pickedfile!.path!);
                    storage.FirebaseStorage firebase = storage.FirebaseStorage.instance;
                    late String fileurl = "";
                    await firebase.ref('files/${UniqueKey().toString()}.png').putFile(file).then((taskSnapshot)async {
                     fileurl= await taskSnapshot.ref.getDownloadURL();
                    });
                    FirebaseFirestore.instance.collection('user').doc(chatID).collection('chat').add({
                      "userID": FirebaseAuth.instance.currentUser!.uid,
                      "username": FirebaseAuth.instance.currentUser!.displayName,
                      "message": _messagecontroller.text,
                      "timestamp": Timestamp.now(),
                      "imageurl": "",
                       "fileurl":fileurl,
                    }).then((docref) => docref.update({"docid":docref.id}));
                  },

                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

 }
 Future<void> Bi(String docid) async {
   return showModalBottomSheet<void>(
     context: context,
     builder: (BuildContext context) => SafeArea(
       child: SizedBox(
         height: 144,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             TextButton(
               onPressed: () async{
                await FirebaseFirestore.instance.collection('user').doc(chatID).collection('chat').doc(docid).delete();
                Navigator.of(context).pop();
               },
               child: const Align(
                 alignment: AlignmentDirectional.centerStart,
                 child: Text('Delete'),
               ),
             ),
             TextButton(
               onPressed: () => Navigator.pop(context),
               child: const Align(
                 alignment: AlignmentDirectional.centerStart,
                 child: Text('Cancel'),
               ),
             ),
           ],
         ),
       ),
     ),
   );
 }
  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );


  }
  void _handleImageSelection() async {
    xFile = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );
    File file = File(xFile!.path);
    late String imageurl1;
    storage.FirebaseStorage firebaseStorage = storage.FirebaseStorage.instance;
    await firebaseStorage.ref('image/${UniqueKey().toString()}.png').putFile(file).then((taskSnapshot)async {
      imageurl1= await taskSnapshot.ref.getDownloadURL();
    });
    print(imageurl1);
    await FirebaseFirestore.instance.collection('user').doc(chatID).collection('chat').add({
      "userID": FirebaseAuth.instance.currentUser!.uid,
      "username": FirebaseAuth.instance.currentUser!.displayName,
      "message": _messagecontroller.text,
      "timestamp": Timestamp.now(),
      "imageurl": imageurl1,
      "fileurl": "",

    }).then((docref) => docref.update({"docid":docref.id}));
    Navigator.of(context).pop();

  }
  Future sendmess() async{
    print(imageurl);
    DocumentReference doc;
    await FirebaseFirestore.instance.collection('user').doc(chatID).collection('chat').add({
      "userID": FirebaseAuth.instance.currentUser!.uid,
      "username": FirebaseAuth.instance.currentUser!.displayName,
      "message": _messagecontroller.text,
      "timestamp": Timestamp.now(),
      "imageurl":"",
      "fileurl":"",

    }).then((docref) => docref.update({"docid":docref.id}));

    setState(() {
      _messagecontroller.clear();
    });

  }
}


