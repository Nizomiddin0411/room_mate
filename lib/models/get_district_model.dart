class GetDistrictModel {
  int? id;
  int? regionId;
  String? name;
  String? nameRu;

  GetDistrictModel({this.id, this.regionId, this.name, this.nameRu});

  GetDistrictModel.fromJson(Map<String, dynamic> json) {
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