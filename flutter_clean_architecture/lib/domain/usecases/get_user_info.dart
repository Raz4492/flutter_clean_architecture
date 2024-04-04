import 'package:my_flutter_app/domain/entities/user.dart';
import 'package:my_flutter_app/domain/repositories/user_repository.dart';

class GetUserDomainInfo {
  final UserRepository repository;

  GetUserDomainInfo(this.repository);

  Future<User> call() async {
    return repository.getUserRepositoryInfo();
  }
}
