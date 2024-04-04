import 'package:my_flutter_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUserInfo();
}
//my_flutter_app