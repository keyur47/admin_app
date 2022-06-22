// To parse this JSON data, do
//
//     final datamodel = datamodelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserDataModel articleModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String articleModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({this.title, this.url, this.time, this.image});

  String? title;
  String? url;
  String? image;
  Timestamp? time;

  UserDataModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    title = data["title"] == null ? null : data["title"];
    url = data["url"] == null ? null : data["url"];
    time = data["time"] == null ? null : data["time"];
    image = data["image"] == null ? null : data["image"];
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        time: json["time"] == null ? null : json["time"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "time": time == null ? null : time,
        "image": image == null ? null : image,
      };
}
