import 'package:get_it/get_it.dart';
import 'package:test_api_4/data/data_sources/remote_users_data_source.dart';
import 'package:test_api_4/data/repositories/users_repository_impl.dart';
import 'package:test_api_4/domain/repositories/users_repository.dart';
import 'package:test_api_4/domain/usecases/get_users_usecase.dart';
import 'package:test_api_4/presentation/bloc/users_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => UsersBloc(locator()));

  locator.registerLazySingleton(() => GetUsersUseCase(locator()));

  locator.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(locator()));

  locator.registerLazySingleton<RemoteUsersDataSource>(
      () => RemoteUsersDataSourceImpl());
}
