import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dope_chat/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchRepositoryProvider = Provider((ref) => SearchRepository(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class SearchRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  SearchRepository({
    required this.auth,
    required this.firestore,
  });

  Stream<List<UserModel>> searchUser(String query, BuildContext context) {
    return firestore
        .collection('users')
        .where(
          'userName',
          isGreaterThanOrEqualTo: query,
        )
        .snapshots()
        .asyncMap((event) async {
      List<UserModel> list = [];
      for (var document in event.docs) {
        final userModel = UserModel.fromMap(document.data());
        if (userModel.uid == auth.currentUser!.uid) continue;
        list.add(userModel);
      }
      return list;
    });
  }

  void addOrRemoveRequestlist(String myUid, String userUid) async {
    var userCollection = await firestore.collection('users').doc(userUid).get();
    UserModel user = UserModel.fromMap(userCollection.data()!);
    List<String> reqList = user.reqfriends;
    if (user.reqfriends.contains(myUid)) {
      reqList.remove(myUid);
      await firestore
          .collection('users')
          .doc(userUid)
          .update({'reqfriends': reqList});
    } else {
      reqList.add(myUid);
      await firestore
          .collection('users')
          .doc(userUid)
          .update({'reqfriends': reqList});
    }
  }
}
