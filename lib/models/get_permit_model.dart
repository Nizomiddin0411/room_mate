class chatPermitModel {
  int? id;
  int? userAsked;
  String? userAskedFullName;
  int? userApproved;
  int? approved;
  String? createdAt;

  chatPermitModel(
      {this.id,
        this.userAsked,
        this.userAskedFullName,
        this.userApproved,
        this.approved,
        this.createdAt});

  chatPermitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userAsked = json['user_asked'];
    userAskedFullName = json['user_asked_full_name'];
    userApproved = json['user_approved'];
    approved = json['approved'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_asked'] = this.userAsked;
    data['user_asked_full_name'] = this.userAskedFullName;
    data['user_approved'] = this.userApproved;
    data['approved'] = this.approved;
    data['created_at'] = this.createdAt;
    return data;
  }
}