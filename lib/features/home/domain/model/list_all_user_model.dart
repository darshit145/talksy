// To parse this JSON data, do
//
//     final listAllUser = listAllUserFromJson(jsonString);

import 'dart:convert';

ListAllUser listAllUserFromJson(String str) => ListAllUser.fromJson(json.decode(str));

String listAllUserToJson(ListAllUser data) => json.encode(data.toJson());

class ListAllUser {
  List<Result> result;

  ListAllUser({
    required this.result,
  });

  factory ListAllUser.fromJson(Map<String, dynamic> json) => ListAllUser(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  String id;
  String uEmail;
  String uName;
  String uPhoto;
  int v;

  Result({
    required this.id,
    required this.uEmail,
    required this.uName,
    required this.uPhoto,
    required this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    uEmail: json["u_email"],
    uName: json["u_name"],
    uPhoto: json["u_photo"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "u_email": uEmail,
    "u_name": uName,
    "u_photo": uPhoto,
    "__v": v,
  };
}
