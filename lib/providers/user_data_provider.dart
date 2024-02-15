import 'package:flutter_jsonplaceholder/api/user_api.dart';
import 'package:flutter_jsonplaceholder/models/user_model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
