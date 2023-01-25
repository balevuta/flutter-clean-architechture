import 'package:test_api_4/domain/entities/user.dart';

abstract class UsersState {
  UsersState();
}

class UsersLoadedEmpty extends UsersState {}

class UsersLoadedError extends UsersState {}

class UsersItemClick extends UsersState {}

class UsersLoadedSucceed extends UsersState {
  final List<User> result;

  UsersLoadedSucceed(this.result);
}