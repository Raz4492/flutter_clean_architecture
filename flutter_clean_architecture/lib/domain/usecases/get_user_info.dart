import 'package:my_flutter_app/domain/entities/user.dart';
import 'package:my_flutter_app/domain/repositories/user_repository.dart';

class GetUserInfo {
  final UserRepository repository;

  GetUserInfo(this.repository);

  Future<User> call() async {
    return repository.getUserInfo();
  }
}
