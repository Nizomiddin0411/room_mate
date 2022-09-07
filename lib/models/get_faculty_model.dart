class GetFacultyModel {
  int? id;
  int? universityId;
  String? name;
  String? nameRu;
  String? advertising;
  String? searching;

  GetFacultyModel(
      {this.id,
        this.universityId,
        this.name,
        this.nameRu,
        this.advertising,
        this.searching});

  GetFacultyModel.fromJson(Map<String, dynamic> json) {
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