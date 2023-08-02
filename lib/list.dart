import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Lister{
  final String name;
  final String email;
  final String chatid;
  Lister({
    required this.name,
    required this.email,
    required this.chatid,
   });
  Lister.fromSnapshot(QueryDocumentSnapshot doc):
        name= doc["name"]as String,
      email=doc["email"]as String,
      chatid= doc["chatID"]as String;
}