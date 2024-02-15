import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import 'package:flutter_jsonplaceholder/pages/post_detail_page.dart';
import 'package:flutter_jsonplaceholder/providers/ptac_data_provider.dart';
import 'package:flutter_jsonplaceholder/widgets/post_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsWidget extends ConsumerWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(postsDataProvider);
    return Scaffold(
      body: data.when(
          data: (data) {
            List<PostComments>? postsList = data!.map((e) => e).toList();
            return Center(
              child: ListView.builder(
                itemCount: postsList.length,
                itemBuilder: (_, int index) {
                  PostComments post = postsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PostTileWidget(postInfo: post,showUsername: true),
                  );
                },
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
