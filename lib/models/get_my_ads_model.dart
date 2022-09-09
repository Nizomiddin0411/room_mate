class GetMyAdsModel {
  int? id;
  int? type;
  int? userId;
  int? districtId;
  int? universityId;
  int? facultyId;
  dynamic address;
  dynamic roomCount;
  int? liveWithOwner;
  int? houseType;
  int? rentType;
  String? cost;
  int? costType;
  int? subway;
  int? roommateGender;
  int? roommateCount;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? favorite;

  GetMyAdsModel(
      {this.id,
        this.type,
        this.userId,
        this.districtId,
        this.universityId,
        this.facultyId,
        this.address,
        this.roomCount,
        this.liveWithOwner,
        this.houseType,
        this.rentType,
        this.cost,
        this.costType,
        this.subway,
        this.roommateGender,
        this.roommateCount,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.favorite});

  GetMyAdsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    userId = json['user_id'];
    districtId = json['district_id'];
    universityId = json['university_id'];
    facultyId = json['faculty_id'];
    address = json['address'];
    roomCount = json['room_count'];
    liveWithOwner = json['live_with_owner'];
    houseType = json['house_type'];
    rentType = json['rent_type'];
    cost = json['cost'];
    costType = json['cost_type'];
    subway = json['subway'];
    roommateGender = json['roommate_gender'];
    roommateCount = json['roommate_count'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['district_id'] = this.districtId;
    data['university_id'] = this.universityId;
    data['faculty_id'] = this.facultyId;
    data['address'] = this.address;
    data['room_count'] = this.roomCount;
    data['live_with_owner'] = this.liveWithOwner;
    data['house_type'] = this.houseType;
    data['rent_type'] = this.rentType;
    data['cost'] = this.cost;
    data['cost_type'] = this.costType;
    data['subway'] = this.subway;
    data['roommate_gender'] = this.roommateGender;
    data['roommate_count'] = this.roommateCount;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['favorite'] = this.favorite;
    return data;
  }
}


