class ProfileModel {
  bool? status;
  int? userId;
  String? fullName;
  int? roleId;
  String? accessToken;
  int? hideProfile;
  int? hidePhone;

  ProfileModel(
      {this.status,
        this.userId,
        this.fullName,
        this.roleId,
        this.accessToken,
        this.hideProfile,
        this.hidePhone});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    fullName = json['full_name'];
    roleId = json['role_id'];
    accessToken = json['access_token'];
    hideProfile = json['hide_profile'];
    hidePhone = json['hide_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['role_id'] = this.roleId;
    data['access_token'] = this.accessToken;
    data['hide_profile'] = this.hideProfile;
    data['hide_phone'] = this.hidePhone;
    return data;
  }
}