class GetMyAdsModel {
  int? id;
  int? type;
  int? userId;
  int? districtId;
  dynamic universityId;
  dynamic facultyId;
  String? address;
  int? roomCount;
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
  Region? region;
  District? district;
  dynamic university;
  dynamic faculty;

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
        this.favorite,
        this.region,
        this.district,
        this.university,
        this.faculty});

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
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    university = json['university'];
    faculty = json['faculty'];
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
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    data['university'] = this.university;
    data['faculty'] = this.faculty;
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? nameRu;

  Region({this.id, this.name, this.nameRu});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameRu = json['name_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ru'] = this.nameRu;
    return data;
  }
}

class District {
  int? id;
  int? regionId;
  String? name;
  String? nameRu;

  District({this.id, this.regionId, this.name, this.nameRu});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionId = json['region_id'];
    name = json['name'];
    nameRu = json['name_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['region_id'] = this.regionId;
    data['name'] = this.name;
    data['name_ru'] = this.nameRu;
    return data;
  }
}