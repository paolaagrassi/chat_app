import 'package:chat_app/auth/core/repositories/user_repository.dart';
import 'package:chat_app/auth/models/models.dart';

import '../wrappers/result.dart';

abstract class UserService {
  Future<Result<bool>> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail);

  Future<Result<bool>> login(String emailAddress, String password);

  Future deleteUser(String id);

  Future<Result<List<UserModel>?>> getAllUsers();

  List<UserModel> userList = <UserModel>[];
}

class UserServiceImpl implements UserService {
  final UserRepository userRepository;

  UserServiceImpl({required this.userRepository});

  @override
  List<UserModel> userList = <UserModel>[];

  @override
  Future<Result<bool>> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail) async {
    final result = await userRepository.registerUser(
        emailAddress, password, userName, userBirth, userEmail);

    return result;
  }

  @override
  Future<Result<bool>> login(String emailAddress, String password) async {
    final result = await userRepository.login(emailAddress, password);

    return result;
  }

  @override
  Future deleteUser(String id) async {
    await userRepository.deleteUser(id);
  }

  @override
  Future<Result<List<UserModel>?>> getAllUsers() async {
    final result = await userRepository.getAllUsers();

    return result;
  }
}
