// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/data/datasources/user_api.dart';
import 'package:my_flutter_app/data/repositories_impl/user_repository_impl.dart';
import 'package:my_flutter_app/domain/repositories/user_repository.dart';
import 'package:my_flutter_app/domain/usecases/get_user_info.dart';
import 'package:my_flutter_app/presentation/blocs/user_info_bloc.dart';
import 'package:my_flutter_app/presentation/screens/user_info_screen.dart';

void main() {
  testWidgets('UserInfoScreen displays user info', (WidgetTester tester) async {
    final UserRepository userRepository = UserRepositoryImpl(UserApi());
    final GetUserInfo getUserInfo = GetUserInfo(userRepository);
    final UserInfoBloc userInfoBloc = UserInfoBloc(getUserInfo);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => userInfoBloc,
          child: UserInfoScreen(),
        ),
      ),
    );

    // Verify that loading indicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the API call to complete
    await tester.pump(Duration(seconds: 1));

    // Verify that user info is displayed
    expect(find.text('Name:'), findsWidgets);
    expect(find.text('Username:'), findsWidgets);
    expect(find.text('Email:'), findsWidgets);
    expect(find.text('Phone:'), findsWidgets);
    expect(find.text('Website:'), findsWidgets);
  });
}
