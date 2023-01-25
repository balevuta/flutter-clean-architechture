import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_api_4/data/models/user_model.dart';
import 'package:test_api_4/utils/constants.dart';

abstract class RemoteUsersDataSource {
  Future<List<UserModel>> getUsers();
}

class RemoteUsersDataSourceImpl extends RemoteUsersDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    var url = Uri.parse(Constants.allUsersUrl);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return getUserModelsFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return List<UserModel>.empty();
  }
}
