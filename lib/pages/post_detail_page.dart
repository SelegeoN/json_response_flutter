import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/comments_model/comments_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.post});
  final PostComments post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.user.name}'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Заголовок:',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8,),
                Text(
                  '${post.post.title}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8,),
                Text(
                  'Тело:',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8,),
                Text(
                  '${post.post.body}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10,),
                Text(
                  'Комментарии',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: post.comments.length,
                  itemBuilder: (_, int index) {
                    Comment comment = post.comments[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        padding : const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                  Theme.of(context).colorScheme.inversePrimary),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Text('${comment.email}'),
                            Text('${comment.name}',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                            Text('${comment.body}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
