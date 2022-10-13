class GetMyAdsModel {
  int? id;
  int? type;
  int? userId;
  String? title;
  int? stayRegionId;
  int? stayRegionMatter;
  int? stayUniversityId;
  int? stayUniversityMatter;
  int? roommateGender;
  dynamic genderMatter;
  int? roommateCount;
  String? phoneNumber;
  dynamic phoneNumberShow;
  dynamic haveLivingHome;
  String? description;
  int? districtId;
  String? address;
  String? location;
  int? subway;
  int? houseType;
  dynamic roomCount;
  dynamic floorsCount;
  dynamic inFloor;
  String? cost;
  dynamic costType;
  int? liveWithOwner;
  int? utilityBills;
  dynamic utilityElectricity;
  dynamic unilityGaz;
  dynamic utilityHotWater;
  dynamic utilityColdWater;
  dynamic utilityTrash;
  String? comfort;
  dynamic universityId;
  dynamic universityIdMatter;
  dynamic rentType;
  String? createdAt;
  String? updatedAt;
  dynamic costPeriod;
  String? userFullName;
  String? favorite;
  int? chatApproved;
  List<dynamic>? images;
  Region? region;
  Region? stayRegion;
  District? district;
  dynamic university;
  StayUniversity? stayUniversity;

  GetMyAdsModel(
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
        this.costPeriod,
        this.userFullName,
        this.favorite,
        this.chatApproved,
        this.images,
        this.region,
        this.stayRegion,
        this.district,
        this.university,
        this.stayUniversity});

  GetMyAdsModel.fromJson(Map<String, dynamic> json) {
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
    costPeriod = json['cost_period'];
    userFullName = json['user_full_name'];
    favorite = json['favorite'];
    chatApproved = json['chat_approved'];
    if (json['images'] != null) {
      images = <dynamic>[];
      json['images'].forEach((v) {
        images!.add(v.fromJson(v));
      });
    }
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
    stayRegion = json['stay_region'] != null
        ? new Region.fromJson(json['stay_region'])
        : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    university = json['university'];
    stayUniversity = json['stay_university'] != null
        ? new StayUniversity.fromJson(json['stay_university'])
        : null;
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
    data['cost_period'] = this.costPeriod;
    data['user_full_name'] = this.userFullName;
    data['favorite'] = this.favorite;
    data['chat_approved'] = this.chatApproved;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.stayRegion != null) {
      data['stay_region'] = this.stayRegion!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    data['university'] = this.university;
    if (this.stayUniversity != null) {
      data['stay_university'] = this.stayUniversity!.toJson();
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

class StayUniversity {
  int? id;
  String? name;
  String? nameRu;
  String? short;
  dynamic districtId;
  dynamic address;
  String? advertising;
  String? searching;

  StayUniversity(
      {this.id,
        this.name,
        this.nameRu,
        this.short,
        this.districtId,
        this.address,
        this.advertising,
        this.searching});

  StayUniversity.fromJson(Map<String, dynamic> json) {
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