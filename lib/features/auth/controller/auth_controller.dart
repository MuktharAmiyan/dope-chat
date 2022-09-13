import 'dart:io';
import 'package:dope_chat/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dope_chat/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});
final getUserDataAuthProvider = FutureProvider((ref) {
  final authController = ref.read(authControllerProvider);
  return authController.getCurrentUser();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhoneNumber(BuildContext context, String phoneNumber) {
    authRepository.signinWithPhoneNumber(context, phoneNumber);
  }

  void verifyOTP(
    BuildContext context,
    String verificationID,
    String userOtp,
  ) {
    authRepository.verifyOTP(context, verificationID, userOtp, ref);
  }

  Future<UserModel?> getCurrentUser() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

  void saveUserDataToFireBase(
    BuildContext context,
    String name,
    String dob,
    String userName,
    File? profilePic,
  ) {
    authRepository.saveUserDataToFireBase(
        context, name, dob, userName, profilePic, ref);
  }

  Stream<UserModel> getUserDataWithUid(String uid) {
    return authRepository.getUserDataWithUid(uid);
  }

  Future<bool> checkUsername(String userName) async {
    return authRepository.checkUserName(userName);
  }
}
