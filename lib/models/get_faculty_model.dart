class GetFacultyModel {
  int? id;
  int? universityId;
  String? name;
  String? nameRu;

  GetFacultyModel({this.id, this.universityId, this.name, this.nameRu});

  GetFacultyModel.fromJson(Map<String, dynamic> json) {
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