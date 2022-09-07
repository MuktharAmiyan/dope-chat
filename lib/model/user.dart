class UserModel {
  final String uid;
  final String userName;
  final DateTime userNameChangedDate;
  final String name;
  final String dob;
  final String profilePic;
  final bool isOnline;
  List<String> friends;
  List<String> reqfriends;
  UserModel({
    required this.uid,
    required this.userName,
    required this.userNameChangedDate,
    required this.name,
    required this.dob,
    required this.profilePic,
    required this.isOnline,
    required this.friends,
    required this.reqfriends,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'userName': userName});
    result.addAll(
        {'userNameChangedDate': userNameChangedDate.millisecondsSinceEpoch});
    result.addAll({'name': name});
    result.addAll({'dob': dob});
    result.addAll({'profilePic': profilePic});
    result.addAll({'isOnline': isOnline});
    result.addAll({'friends': friends});
    result.addAll({'reqfriends': reqfriends});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      userName: map['userName'] ?? '',
      userNameChangedDate:
          DateTime.fromMillisecondsSinceEpoch(map['userNameChangedDate']),
      name: map['name'] ?? '',
      dob: map['dob'] ?? '',
      profilePic: map['profilePic'] ?? '',
      isOnline: map['isOnline'] ?? false,
      friends: List<String>.from(map['friends']),
      reqfriends: List<String>.from(map['reqfriends']),
    );
  }
}
