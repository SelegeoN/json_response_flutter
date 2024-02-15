import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import '../models/user_model/user_model.dart';
import '../pages/post_detail_page.dart';
import '../pages/user_detail_page.dart';

class PostTileWidget extends StatelessWidget {
  const PostTileWidget(
      {super.key, required this.postInfo, required this.showUsername});

  final PostComments postInfo;
  final bool showUsername;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PostDetailPage(
                post: postInfo,
              ))),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: showUsername == true
            ? ListTile(
                title: Text('${postInfo.post.id}.${postInfo.post.title}'),
                subtitle: Text(postInfo.user.name),
              )
            : ListTile(
          title: Text('${postInfo.post.id}.${postInfo.post.title}'),
              ),
      ),
    );
  }
}
