import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_api_4/domain/usecases/get_users_usecase.dart';
import 'package:test_api_4/presentation/bloc/users_bloc_event.dart';
import 'package:test_api_4/presentation/bloc/users_bloc_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  GetUsersUseCase _getUsersUseCase;

  UsersBloc(this._getUsersUseCase) : super(UsersLoadedEmpty()) {
    on<OnGetUsersEvent>((event, emit) async {
      try {
        var result = await _getUsersUseCase.execute();
        emit(UsersLoadedSucceed(result));
      } catch (e) {
        emit(UsersLoadedError());
      }
    });
    on<OnUserItemClickEvent>((event, emit) {
      emit(UsersItemClick());
    });
  }
}
