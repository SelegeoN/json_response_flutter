import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/providers/user_data_provider.dart';
import 'package:flutter_jsonplaceholder/widgets/user_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model/user_model.dart';
import '../providers/ptac_data_provider.dart';

class UsersWidget extends ConsumerWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      body: data.when(
          data: (data) {
            List<User> userList = data.map((e) => e).toList();
            return Center(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, int index) {
                  User userInfo = userList[index];
                  return UserTileWidget(userInfo: userInfo);
                },
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () =>
          const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
