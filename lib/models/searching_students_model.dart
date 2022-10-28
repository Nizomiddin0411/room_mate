class SearchingStudents {
  int? id;
  String? fullName;
  String? phone;
  int? gender;
  int? universityId;
  int? facultyId;
  int? course;
  dynamic  roommate;
  int? birthRegionId;
  int? birthDistrictId;
  int? hideProfile;
  int? hidePhone;
  BirthRegion? birthRegion;
  BirthDistrict? birthDistrict;
  University? university;
  Faculty? faculty;

  SearchingStudents(
      {this.id,
        this.fullName,
        this.phone,
        this.gender,
        this.universityId,
        this.facultyId,
        this.course,
        this.roommate,
        this.birthRegionId,
        this.birthDistrictId,
        this.hideProfile,
        this.hidePhone,
        this.birthRegion,
        this.birthDistrict,
        this.university,
        this.faculty});

  SearchingStudents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    gender = json['gender'];
    universityId = json['university_id'];
    facultyId = json['faculty_id'];
    course = json['course'];
    roommate = json['roommate'];
    birthRegionId = json['birth_region_id'];
    birthDistrictId = json['birth_district_id'];
    hideProfile = json['hide_profile'];
    hidePhone = json['hide_phone'];
    birthRegion = json['birth_region'] != null
        ? new BirthRegion.fromJson(json['birth_region'])
        : null;
    birthDistrict = json['birth_district'] != null
        ? new BirthDistrict.fromJson(json['birth_district'])
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
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['university_id'] = this.universityId;
    data['faculty_id'] = this.facultyId;
    data['course'] = this.course;
    data['roommate'] = this.roommate;
    data['birth_region_id'] = this.birthRegionId;
    data['birth_district_id'] = this.birthDistrictId;
    data['hide_profile'] = this.hideProfile;
    data['hide_phone'] = this.hidePhone;
    if (this.birthRegion != null) {
      data['birth_region'] = this.birthRegion!.toJson();
    }
    if (this.birthDistrict != null) {
      data['birth_district'] = this.birthDistrict!.toJson();
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

class BirthRegion {
  int? id;
  String? name;
  String? nameRu;

  BirthRegion({this.id, this.name, this.nameRu});

  BirthRegion.fromJson(Map<String, dynamic> json) {
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

class BirthDistrict {
  int? id;
  int? regionId;
  String? name;
  String? nameRu;

  BirthDistrict({this.id, this.regionId, this.name, this.nameRu});

  BirthDistrict.fromJson(Map<String, dynamic> json) {
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

  Faculty({this.id, this.universityId, this.name, this.nameRu});

  Faculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    universityId = json['university_id'];
    name = json['name'];
    nameRu = json['name_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['university_id'] = this.universityId;
    data['name'] = this.name;
    data['name_ru'] = this.nameRu;
    return data;
  }
}