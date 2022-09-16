// To parse this JSON data, do
//
//     final getFacultyModel = getFacultyModelFromJson(jsonString);

import 'dart:convert';

List<GetFacultyModel> getFacultyModelFromJson(String str) => List<GetFacultyModel>.from(json.decode(str).map((x) => GetFacultyModel.fromJson(x)));

String getFacultyModelToJson(List<GetFacultyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFacultyModel {
  GetFacultyModel({
    required this.id,
    required this.universityId,
    required this.name,
    required this.nameRu,
    required this.advertising,
    required this.searching,
  });

  int id;
  int universityId;
  String name;
  String nameRu;
  String advertising;
  String searching;

  factory GetFacultyModel.fromJson(Map<String, dynamic> json) => GetFacultyModel(
    id: json["id"],
    universityId: json["university_id"],
    name: json["name"],
    nameRu: json["name_ru"],
    advertising: json["advertising"],
    searching: json["searching"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "university_id": universityId,
    "name": name,
    "name_ru": nameRu,
    "advertising": advertising,
    "searching": searching,
  };
}
