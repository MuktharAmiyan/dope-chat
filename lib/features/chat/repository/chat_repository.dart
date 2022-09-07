import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  ChatRepository({
    required this.auth,
    required this.firestore,
  });
}
