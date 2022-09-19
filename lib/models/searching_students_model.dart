class SearchingStudents {
  int? id;
  String? fullName;
  String? phone;
  int? gender;
  int? universityId;
  int? facultyId;
  int? course;
  int? roommate;
  int? birthRegionId;
  int? birthDistrictId;

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
        this.birthDistrictId});

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
    return data;
  }
}