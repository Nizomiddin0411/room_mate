class FavoritemModel {
  int? id;
  int? type;
  int? userId;
  String? userFullName;
  int? districtId;
  int? universityId;
  int? facultyId;
  dynamic address;
  dynamic roomCount;
  int? liveWithOwner;
  int? houseType;
  int? rentType;
  String? cost;
  dynamic costType;
  int? subway;
  int? roommateGender;
  int? roommateCount;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? favorite;
  int? chatApproved;
  Region? region;
  District? district;
  University? university;
  Faculty? faculty;

  FavoritemModel(
      {this.id,
        this.type,
        this.userId,
        this.userFullName,
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
        this.chatApproved,
        this.region,
        this.district,
        this.university,
        this.faculty});

  FavoritemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    userId = json['user_id'];
    userFullName = json['user_full_name'];
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
    chatApproved = json['chat_approved'];
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    university = json['university'] != null
        ? new University.fromJson(json['university'])
        : null;
    faculty =
    json['faculty'] != null ? new Faculty.fromJson(json['faculty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['user_full_name'] = this.userFullName;
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
    data['chat_approved'] = this.chatApproved;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.university != null) {
      data['university'] = this.university!.toJson();
    }
    if (this.faculty != null) {
      data['faculty'] = this.faculty!.toJson();
    }
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

class University {
  int? id;
  String? name;
  String? nameRu;
  String? short;
  dynamic districtId;
  dynamic address;
  String? advertising;
  String? searching;

  University(
      {this.id,
        this.name,
        this.nameRu,
        this.short,
        this.districtId,
        this.address,
        this.advertising,
        this.searching});

  University.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameRu = json['name_ru'];
    short = json['short'];
    districtId = json['district_id'];
    address = json['address'];
    advertising = json['advertising'];
    searching = json['searching'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ru'] = this.nameRu;
    data['short'] = this.short;
    data['district_id'] = this.districtId;
    data['address'] = this.address;
    data['advertising'] = this.advertising;
    data['searching'] = this.searching;
    return data;
  }
}

class Faculty {
  int? id;
  int? universityId;
  String? name;
  String? nameRu;
  String? advertising;
  String? searching;

  Faculty(
      {this.id,
        this.universityId,
        this.name,
        this.nameRu,
        this.advertising,
        this.searching});

  Faculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    universityId = json['university_id'];
    name = json['name'];
    nameRu = json['name_ru'];
    advertising = json['advertising'];
    searching = json['searching'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['university_id'] = this.universityId;
    data['name'] = this.name;
    data['name_ru'] = this.nameRu;
    data['advertising'] = this.advertising;
    data['searching'] = this.searching;
    return data;
  }
}