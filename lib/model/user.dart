class UserModel {
  final String uid;
  final String name;
  final String dob;
  final String profilePic;
  final String createdAt;
  UserModel({
    required this.uid,
    required this.name,
    required this.dob,
    required this.profilePic,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'dob': dob});
    result.addAll({'profilePic': profilePic});
    result.addAll({'createdAt': createdAt});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      dob: map['dob'] ?? '',
      profilePic: map['profilePic'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }
}
