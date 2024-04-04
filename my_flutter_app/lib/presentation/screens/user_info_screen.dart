import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/core/errors/app_error.dart';
import 'package:my_flutter_app/domain/entities/user.dart';

import '../blocs/UserInfoEvent.dart';
import '../blocs/UserInfoState.dart';
import '../blocs/user_info_bloc.dart';

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserInfoLoaded) {
            return _buildUserInfo(state.user);
          } else if (state is UserInfoError) {
            return Center(
              child: Text('Error: ${state.error.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchUserInfo(context);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  void _fetchUserInfo(BuildContext context) {
    BlocProvider.of<UserInfoBloc>(context).add(FetchUserInfo());
  }

  Widget _buildUserInfo(User user) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ID: ${user.id}'),
          Text('Name: ${user.name}'),
          Text('Username: ${user.username}'),
          Text('Email: ${user.email}'),
          Text('Phone: ${user.phone}'),
          Text('Website: ${user.website}'),
        ],
      ),
    );
  }
}
