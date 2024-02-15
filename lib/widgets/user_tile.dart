
import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import '../models/user_model/user_model.dart';
import '../pages/user_detail_page.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({super.key, required this.userInfo});
  final User userInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    UserDetailPage(user: userInfo))),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            title: Text(
              '${userInfo.id}.${userInfo.name}',
              style: TextStyle(fontSize: 16.0),
            ),
            subtitle: Text(
              userInfo.email,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
