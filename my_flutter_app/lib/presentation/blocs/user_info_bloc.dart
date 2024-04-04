import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/domain/entities/user.dart';
import 'package:my_flutter_app/domain/usecases/get_user_info.dart';

import '../../core/errors/app_error.dart';
import 'UserInfoEvent.dart';
import 'UserInfoState.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final GetUserInfo getUserInfo;

  UserInfoBloc(this.getUserInfo) : super(UserInfoInitial()) {
    on<FetchUserInfo>(_mapFetchUserInfoToState);
  }

  Future<void> _mapFetchUserInfoToState(
    FetchUserInfo event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(UserInfoLoading());

    try {
      final userInfo = await getUserInfo();
      emit(UserInfoLoaded(userInfo));
    } catch (error) {
      emit(UserInfoError(AppError(error.toString())));
    }
  }
}

