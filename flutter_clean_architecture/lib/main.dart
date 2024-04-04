import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/core/errors/app_error.dart';
import 'package:my_flutter_app/data/datasources/user_api.dart';
import 'package:my_flutter_app/data/repositories_impl/user_repository_impl.dart';
import 'package:my_flutter_app/domain/repositories/user_repository.dart';
import 'package:my_flutter_app/domain/usecases/get_user_info.dart';
import 'package:my_flutter_app/presentation/blocs/user_info_bloc.dart';
import 'package:my_flutter_app/presentation/screens/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/data/datasources/user_api.dart';
import 'package:my_flutter_app/data/repositories_impl/user_repository_impl.dart';
import 'package:my_flutter_app/domain/repositories/user_repository.dart';
import 'package:my_flutter_app/domain/usecases/get_user_info.dart';
import 'package:my_flutter_app/presentation/blocs/user_info_bloc.dart';
import 'package:my_flutter_app/presentation/screens/user_info_screen.dart';

void main() {
  final UserRepository userRepository = UserRepositoryImpl(UserApi());
  final GetUserDomainInfo getUserInfo = GetUserDomainInfo(userRepository);

  runApp(MyApp(getUserInfo: getUserInfo));
}

class MyApp extends StatelessWidget {
  final GetUserDomainInfo getUserInfo;

  const MyApp({Key? key, required this.getUserInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => UserInfoBloc(getUserInfo),
        child: UserInfoScreen(),
      ),
    );
  }
}
