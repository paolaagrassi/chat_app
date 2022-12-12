import 'dart:developer';

import 'package:chat_app/auth/core/serializers/serializers.dart';
import 'package:chat_app/auth/core/wrappers/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/models.dart';

abstract class UserRepository {
  Future<Result<bool>> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail);

  Future<Result<bool>> login(String emailAddress, String password);

  Future deleteUser(String id);

  Future<Result<List<UserModel>?>> getAllUsers();

  List<UserModel> userList = <UserModel>[];
}

class UserRepositoryImpl implements UserRepository {
  @override
  List<UserModel> userList = <UserModel>[];

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('usersInformations');

  @override
  Future<Result<bool>> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      usersCollection.add(
        {
          'userId': user.user!.uid,
          'userName': userName,
          'userBirth': userBirth,
          'userEmail': userEmail,
        },
      );

      return ResultSuccess(true);
    } on FirebaseAuthException catch (e) {
      return ResultError(BaseError(message: e.toString()));
    }
  }

  @override
  Future<Result<bool>> login(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return ResultSuccess(true);
    } catch (e) {
      return ResultError(BaseError(message: 'Error trying to login user!'));
    }
  }

  @override
  Future deleteUser(String id) async {
    return await usersCollection.doc(id).delete().then(
          (doc) => log('Deleted successfully'),
          onError: (e) => log('Error on delete'),
        );
  }

  @override
  Future<Result<List<UserModel>?>> getAllUsers() async {
    try {
      final docRef =
          await FirebaseFirestore.instance.collection('usersInfo').get();

      final rawUserList = docRef.docs;

      final list = rawUserList.map((doc) {
        return UserSerializer.fromMap(doc.data());
      }).toList();

      return ResultSuccess(list);
    } catch (e) {
      return ResultError(BaseError(message: 'Error trying to get users!'));
    }
  }
}
