import 'dart:convert';

import 'package:chat_app/auth/models/models.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserSerializer {
  static Map<String, dynamic> toMap(UserModel model) {
    return <String, dynamic>{
      'userId': model.id,
      'userName': model.name,
      'userBirth': model.birth,
      'userEmail': model.email,
      'docId': model.docId,
    };
  }

  static UserModel fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['userId'],
      name: data?['userName'],
      birth: data?['userBirth'],
      email: data?['userEmail'],
      docId: data?['docId'],
    );
  }

  static Map<String, dynamic> toFirestore(UserModel model) {
    return {
      "userId": model.id,
      "userName": model.name,
      "userBirth": model.birth,
      "userEmail": model.email,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['userId'] ?? '',
      name: map['userName'] ?? '',
      birth: map['userBirth'] ?? '',
      email: map['userEmail'] ?? '',
      docId: map['docId'] ?? '',
    );
  }

  static String toJson(UserModel model) =>
      json.encode(UserSerializer.toMap(model));

  static UserModel fromJson(String source) =>
      UserSerializer.fromMap(json.decode(source) as Map<String, dynamic>);
}
