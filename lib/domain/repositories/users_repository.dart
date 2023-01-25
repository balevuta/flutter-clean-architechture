import 'package:test_api_4/domain/entities/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}