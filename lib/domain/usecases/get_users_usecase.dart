import 'package:test_api_4/domain/entities/user.dart';
import 'package:test_api_4/domain/repositories/users_repository.dart';

class GetUsersUseCase {
  final UsersRepository _usersRepository;

  GetUsersUseCase(this._usersRepository);

  Future<List<User>> execute() {
    return _usersRepository.getUsers();
  }
}
