// To parse this JSON data, do
//
//     final searchUniversitetyModel = searchUniversitetyModelFromJson(jsonString);

import 'dart:convert';

List<SearchUniversitetyModel> searchUniversitetyModelFromJson(String str) => List<SearchUniversitetyModel>.from(json.decode(str).map((x) => SearchUniversitetyModel.fromJson(x)));

String searchUniversitetyModelToJson(List<SearchUniversitetyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchUniversitetyModel {
  SearchUniversitetyModel({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.short,
    required this.districtId,
    required this.address,
    required this.advertising,
    required this.searching,
  });

  int id;
  String name;
  String nameRu;
  String short;
  int districtId;
  String address;
  String advertising;
  String searching;

  factory SearchUniversitetyModel.fromJson(Map<String, dynamic> json) => SearchUniversitetyModel(
    id: json["id"],
    name: json["name"],
    nameRu: json["name_ru"],
    short: json["short"],
    districtId: json["district_id"],
    address: json["address"],
    advertising: json["advertising"],
    searching: json["searching"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ru": nameRu,
    "short": short,
    "district_id": districtId,
    "address": address,
    "advertising": advertising,
    "searching": searching,
  };
}
