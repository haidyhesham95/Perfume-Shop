import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {

   String?  userName, userImage, userEmail;
   Timestamp? createdAt;
   List? userCart, userWish;


   UserModel({
    // required this.userId,
     required this.userName,
     required this.userImage,
     required this.userEmail,
     required this.userCart,
     required this.userWish,
     required this.createdAt,
   });

   UserModel.fromJson(Map<String, dynamic>? json) {
    userName = json!['name'];
   // userId = json['email'];
    userImage = json['phone'];
    userEmail = json['id'];
    userCart = json['type'];
    userWish = json['image'];
    createdAt = json['token'];

  }

  Map<String, dynamic> toMap({required id}) => {
   // 'userId': userId,
    'userName':userName,
    'userImage': userImage,
    'userEmail': userEmail,
    'type': userCart,
    'image': userWish,
    'token': createdAt,
  };
}


