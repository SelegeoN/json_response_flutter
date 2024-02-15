import 'package:flutter_jsonplaceholder/models/user_model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_config.dart';

class UserDioService extends DioClient{
  Future<User> getUser({required String id}) async {
    var userData = await dio.get(baseUrl + '/users/$id');
    print('User Info: ${userData.data}');
    User user = User.fromJson(userData.data);
    return user;
  }
  Future<List<User>> getUsers() async {
    var usersData = await dio.get(baseUrl + '/users');
    return (usersData.data as List)
        .map((x) => User.fromJson(x))
        .toList();
  }
}

final userProvider = Provider<UserDioService>((ref)=>UserDioService());