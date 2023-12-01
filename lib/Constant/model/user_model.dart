import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

   String?  userName, userImage, userEmail;
   Timestamp? createdAt;
   List? userCart, userWish;


   UserModel({
     required this.userName,
     required this.userImage,
     required this.userEmail,
     required this.userCart,
     required this.userWish,
     required this.createdAt,
   });

   UserModel.fromJson(Map<String, dynamic>? json) {
    userName = json!['userName'];
    userImage = json['userImage'];
    userEmail = json['userEmail'];
    userCart = json['userCart'];
    userWish = json['userWish'];
    createdAt = json['createdAt'];

  }

  Map<String, dynamic> toMap({required id}) => {
    'userName':userName,
    'userImage': userImage,
    'userEmail': userEmail,
    'userCart': userCart,
    'userWish': userWish,
    'createdAt': createdAt,
  };
}


