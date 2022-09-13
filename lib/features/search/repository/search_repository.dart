import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dope_chat/common/utils/utils.dart';
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

  void addOrRemoveRequestlist(BuildContext context, String userUid) async {
    try {
      final uid = auth.currentUser!.uid;
      var userCollection =
          await firestore.collection('users').doc(userUid).get();
      UserModel user = UserModel.fromMap(userCollection.data()!);
      List<String> reqList = user.reqfriends;
      if (user.reqfriends.contains(uid)) {
        reqList.remove(uid);
        await firestore
            .collection('users')
            .doc(userUid)
            .update({'reqfriends': reqList});
      } else {
        reqList.add(uid);
        await firestore
            .collection('users')
            .doc(userUid)
            .update({'reqfriends': reqList});
      }
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }

  Stream<List<String>> getFriendListUids() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots()
        .asyncMap((event) async {
      final user = UserModel.fromMap(event.data()!);
      return user.friends;
    });
  }

  Stream<List<String>> getRequestListUids() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots()
        .asyncMap((event) async {
      final user = UserModel.fromMap(event.data()!);
      return user.reqfriends;
    });
  }

  void acceptRequest(BuildContext context, String userUid) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'friends': FieldValue.arrayUnion([userUid])
      }).then((value) => rejectRequest(context, userUid));
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }

  void rejectRequest(BuildContext context, String userUid) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'reqfriends': FieldValue.arrayRemove([userUid])
      });
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
