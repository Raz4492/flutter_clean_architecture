import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/core/errors/app_error.dart';
import 'package:my_flutter_app/domain/entities/user.dart';
import 'package:my_flutter_app/domain/usecases/get_user_info.dart';

import 'UserInfoState.dart';

class UserInfoEvent {}

class FetchUserInfo extends UserInfoEvent {
}


