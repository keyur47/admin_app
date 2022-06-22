// To parse this JSON data, do
//
//     final datamodel = datamodelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

QRDataModel articleModelFromJson(String str) => QRDataModel.fromJson(json.decode(str));

String articleModelToJson(QRDataModel data) => json.encode(data.toJson());

class QRDataModel {
  QRDataModel({
    this.url,
    this.time,
  });

  String? url;
  Timestamp? time;

  QRDataModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    url = data["url"] == null ? null : data["url"];
    time = data["time"] == null ? null : data["time"];
  }

  factory QRDataModel.fromJson(Map<String, dynamic> json) => QRDataModel(
        url: json["url"] == null ? null : json["url"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "time": time == null ? null : time,
      };
}
