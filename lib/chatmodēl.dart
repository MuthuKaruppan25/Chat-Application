import 'package:cloud_firestore/cloud_firestore.dart';

class Chatmodel{
  final String userid;
  final String username;
  final String message;
  final Timestamp timestamp;
  final String imageurl;
  final String fileurl;
  final String docid;
  Chatmodel({
    required this.message,
    required this.timestamp,
    required this.userid,
    required this.username,
    required this.imageurl,
    required this.fileurl,
    required this.docid,
   });
  Chatmodel.fromSnapshot(QueryDocumentSnapshot doc):
        message= doc["message"] as String,
      timestamp= doc["timestamp"] as Timestamp,
      userid=doc["userID"] as String,
      username= doc["username"] as String,
        imageurl=doc["imageurl"]as String,
         fileurl = doc["fileurl"]as String,
         docid= doc["docid"]as String;
}