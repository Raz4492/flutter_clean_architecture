import 'package:my_flutter_app/data/datasources/user_api.dart';
import 'package:my_flutter_app/domain/entities/user.dart';
import 'package:my_flutter_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi);

  @override
  Future<User> getUserInfo() async {
    return userApi.getUserInfo();
  }
}
