class FavoritemModel {
  int? id;
  int? type;
  int? userId;
  String? title;
  dynamic stayRegionId;
  dynamic stayRegionMatter;
  dynamic stayUniversityId;
  dynamic stayUniversityMatter;
  int? roommateGender;
  dynamic genderMatter;
  dynamic roommateCount;
  String? phoneNumber;
  dynamic phoneNumberShow;
  dynamic haveLivingHome;
  String? description;
  int? districtId;
  String? address;
  String? location;
  int? subway;
  int? houseType;
  int? roomCount;
  int? floorsCount;
  int? inFloor;
  String? cost;
  int? costType;
  int? liveWithOwner;
  dynamic utilityBills;
  int? utilityElectricity;
  int? unilityGaz;
  int? utilityHotWater;
  int? utilityColdWater;
  dynamic utilityTrash;
  String? comfort;
  int? universityId;
  dynamic universityIdMatter;
  int? rentType;
  String? createdAt;
  String? updatedAt;
  String? userFullName;
  String? favorite;
  int? chatApproved;
  List<dynamic>? images;
  dynamic region;
  dynamic stayRegion;
  dynamic district;
  University? university;
  Null? stayUniversity;

  FavoritemModel(
      {this.id,
        this.type,
        this.userId,
        this.title,
        this.stayRegionId,
        this.stayRegionMatter,
        this.stayUniversityId,
        this.stayUniversityMatter,
        this.roommateGender,
        this.genderMatter,
        this.roommateCount,
        this.phoneNumber,
        this.phoneNumberShow,
        this.haveLivingHome,
        this.description,
        this.districtId,
        this.address,
        this.location,
        this.subway,
        this.houseType,
        this.roomCount,
        this.floorsCount,
        this.inFloor,
        this.cost,
        this.costType,
        this.liveWithOwner,
        this.utilityBills,
        this.utilityElectricity,
        this.unilityGaz,
        this.utilityHotWater,
        this.utilityColdWater,
        this.utilityTrash,
        this.comfort,
        this.universityId,
        this.universityIdMatter,
        this.rentType,
        this.createdAt,
        this.updatedAt,
        this.userFullName,
        this.favorite,
        this.chatApproved,
        this.images,
        this.region,
        this.stayRegion,
        this.district,
        this.university,
        this.stayUniversity});

  FavoritemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    userId = json['user_id'];
    title = json['title'];
    stayRegionId = json['stay_region_id'];
    stayRegionMatter = json['stay_region_matter'];
    stayUniversityId = json['stay_university_id'];
    stayUniversityMatter = json['stay_university_matter'];
    roommateGender = json['roommate_gender'];
    genderMatter = json['gender_matter'];
    roommateCount = json['roommate_count'];
    phoneNumber = json['phone_number'];
    phoneNumberShow = json['phone_number_show'];
    haveLivingHome = json['have_living_home'];
    description = json['description'];
    districtId = json['district_id'];
    address = json['address'];
    location = json['location'];
    subway = json['subway'];
    houseType = json['house_type'];
    roomCount = json['room_count'];
    floorsCount = json['floors_count'];
    inFloor = json['in_floor'];
    cost = json['cost'];
    costType = json['cost_type'];
    liveWithOwner = json['live_with_owner'];
    utilityBills = json['utility_bills'];
    utilityElectricity = json['utility_electricity'];
    unilityGaz = json['unility_gaz'];
    utilityHotWater = json['utility_hot_water'];
    utilityColdWater = json['utility_cold_water'];
    utilityTrash = json['utility_trash'];
    comfort = json['comfort'];
    universityId = json['university_id'];
    universityIdMatter = json['university_id_matter'];
    rentType = json['rent_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userFullName = json['user_full_name'];
    favorite = json['favorite'];
    chatApproved = json['chat_approved'];
    if (json['images'] != null) {
      images = <dynamic>[];
      json['images'].forEach((v) {
        images!.add( v.fromJson(v));
      });
    }
    region = json['region'];
    stayRegion = json['stay_region'];
    district = json['district'];
    university = json['university'] != null
        ? new University.fromJson(json['university'])
        : null;
    stayUniversity = json['stay_university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['stay_region_id'] = this.stayRegionId;
    data['stay_region_matter'] = this.stayRegionMatter;
    data['stay_university_id'] = this.stayUniversityId;
    data['stay_university_matter'] = this.stayUniversityMatter;
    data['roommate_gender'] = this.roommateGender;
    data['gender_matter'] = this.genderMatter;
    data['roommate_count'] = this.roommateCount;
    data['phone_number'] = this.phoneNumber;
    data['phone_number_show'] = this.phoneNumberShow;
    data['have_living_home'] = this.haveLivingHome;
    data['description'] = this.description;
    data['district_id'] = this.districtId;
    data['address'] = this.address;
    data['location'] = this.location;
    data['subway'] = this.subway;
    data['house_type'] = this.houseType;
    data['room_count'] = this.roomCount;
    data['floors_count'] = this.floorsCount;
    data['in_floor'] = this.inFloor;
    data['cost'] = this.cost;
    data['cost_type'] = this.costType;
    data['live_with_owner'] = this.liveWithOwner;
    data['utility_bills'] = this.utilityBills;
    data['utility_electricity'] = this.utilityElectricity;
    data['unility_gaz'] = this.unilityGaz;
    data['utility_hot_water'] = this.utilityHotWater;
    data['utility_cold_water'] = this.utilityColdWater;
    data['utility_trash'] = this.utilityTrash;
    data['comfort'] = this.comfort;
    data['university_id'] = this.universityId;
    data['university_id_matter'] = this.universityIdMatter;
    data['rent_type'] = this.rentType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_full_name'] = this.userFullName;
    data['favorite'] = this.favorite;
    data['chat_approved'] = this.chatApproved;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['region'] = this.region;
    data['stay_region'] = this.stayRegion;
    data['district'] = this.district;
    if (this.university != null) {
      data['university'] = this.university!.toJson();
    }
    data['stay_university'] = this.stayUniversity;
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