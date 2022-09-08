// To parse this JSON data, do
//
//     final daysKvModel = daysKvModelFromJson(jsonString);

import 'dart:convert';

List<DaysKvModel> daysKvModelFromJson(String str) => List<DaysKvModel>.from(json.decode(str).map((x) => DaysKvModel.fromJson(x)));

String daysKvModelToJson(List<DaysKvModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DaysKvModel {
  DaysKvModel({
    required this.id,
    required this.type,
    required this.userId,
    required this.districtId,
    required this.universityId,
    required this.facultyId,
    this.address,
    this.roomCount,
    required this.liveWithOwner,
    required this.houseType,
    required this.rentType,
    required this.cost,
    required this.costType,
    required this.subway,
    required this.roommateGender,
    required this.roommateCount,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.favorite,
  });

  int id;
  int type;
  int userId;
  int districtId;
  int universityId;
  int facultyId;
  dynamic address;
  dynamic roomCount;
  int liveWithOwner;
  int houseType;
  int rentType;
  String cost;
  int costType;
  int subway;
  int roommateGender;
  int roommateCount;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  String favorite;

  factory DaysKvModel.fromJson(Map<String, dynamic> json) => DaysKvModel(
    id: json["id"],
    type: json["type"],
    userId: json["user_id"],
    districtId: json["district_id"],
    universityId: json["university_id"],
    facultyId: json["faculty_id"],
    address: json["address"],
    roomCount: json["room_count"],
    liveWithOwner: json["live_with_owner"],
    houseType: json["house_type"],
    rentType: json["rent_type"],
    cost: json["cost"],
    costType: json["cost_type"],
    subway: json["subway"],
    roommateGender: json["roommate_gender"],
    roommateCount: json["roommate_count"],
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    favorite: json["favorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "user_id": userId,
    "district_id": districtId,
    "university_id": universityId,
    "faculty_id": facultyId,
    "address": address,
    "room_count": roomCount,
    "live_with_owner": liveWithOwner,
    "house_type": houseType,
    "rent_type": rentType,
    "cost": cost,
    "cost_type": costType,
    "subway": subway,
    "roommate_gender": roommateGender,
    "roommate_count": roommateCount,
    "title": title,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "favorite": favorite,
  };
}
