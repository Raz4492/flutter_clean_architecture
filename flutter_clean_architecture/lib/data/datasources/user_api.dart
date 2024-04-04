import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/core/errors/app_error.dart';
import 'package:my_flutter_app/domain/entities/user.dart';

import '../../core/constants/pp_constants.dart';

class UserApi {
  Future<User> getUserApiUserInfo() async {
    final response = await http.get(Uri.parse(AppConstants.apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final userMap = jsonData[0]; // Using the first user for simplicity
      return User.fromJson(userMap);
    } else {
      throw AppError('Failed to fetch user info');
    }
  }
}
