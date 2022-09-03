import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dope_chat/common/repository/common_firebase_storage_repository.dart';
import 'package:dope_chat/common/utils/utils.dart';
import 'package:dope_chat/features/auth/screen/auth_user_info.dart';
import 'package:dope_chat/features/auth/screen/otp_screen.dart';
import 'package:dope_chat/features/chat/screen/chat_screen.dart';
import 'package:dope_chat/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/const/const.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  void signinWithPhoneNumber(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (error) => showSnakBar(context, error.toString()),
          codeSent: (verificationId, forceResendingToken) async {
            Navigator.pushNamed(
              context,
              OtpScreen.routeName,
              arguments: verificationId,
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return showSnakBar(context, e.toString());
    }
  }

  void verifyOTP(
    BuildContext context,
    String verificationID,
    String userOtp,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: userOtp);
      await auth.signInWithCredential(credential).then((value) =>
          Navigator.pushNamedAndRemoveUntil(
              context, AuthUserInfoScreen.routeName, (route) => false));
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }

  Future<UserModel?> getCurrentUserData() async {
    UserModel? user;
    var currentUserCollection =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    if (currentUserCollection.data() != null) {
      user = UserModel.fromMap(currentUserCollection.data()!);
    }
    return user;
  }

  void saveUserDataToFireBase(
    BuildContext context,
    String name,
    String dob,
    File? profilePic,
    ProviderRef ref,
  ) async {
    try {
      final uid = auth.currentUser!.uid;
      var photoUrl = defuiltProfilePic;
      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageProvider)
            .uplaodToFirebaseStorage('profilePic/$uid', profilePic);
      }
      UserModel user = UserModel(
          uid: uid,
          name: name,
          dob: dob,
          profilePic: photoUrl,
          createdAt: DateTime.now().toString());

      await firestore.collection('users').doc(uid).set(user.toMap()).then(
          (value) => Navigator.pushNamedAndRemoveUntil(
              context, ChatScreen.routeName, (route) => false));
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
