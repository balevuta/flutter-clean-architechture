import 'package:test_api_4/data/data_sources/remote_users_data_source.dart';
import 'package:test_api_4/data/models/user_model.dart';
import 'package:test_api_4/domain/entities/user.dart';
import 'package:test_api_4/domain/repositories/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl(this._remoteUsersDataSource);

  final RemoteUsersDataSource _remoteUsersDataSource;

  @override
  Future<List<User>> getUsers() async {
    var result = await _remoteUsersDataSource.getUsers();
    return toUserEntities(result);
  }
}