import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/core/errors/app_error.dart';
import 'package:my_flutter_app/domain/entities/user.dart';
import 'package:my_flutter_app/domain/usecases/get_user_info.dart';

abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final User user;

  UserInfoLoaded(this.user);
}

class UserInfoError extends UserInfoState {
  final AppError error;

  UserInfoError(this.error);
}