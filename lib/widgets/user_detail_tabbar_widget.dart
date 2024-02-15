import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/albums_model/albums_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import 'package:flutter_jsonplaceholder/widgets/album_tile.dart';
import 'package:flutter_jsonplaceholder/widgets/post_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model/post_model.dart';
import '../models/todos_model/todos_model.dart';

class UserDetailTabsWidget extends StatefulWidget {
  const UserDetailTabsWidget({super.key, required this.ptacOfUser});

  final PTACOfUser ptacOfUser;

  @override
  State<UserDetailTabsWidget> createState() => _UserDetailTabsWidgetState();
}

class _UserDetailTabsWidgetState extends State<UserDetailTabsWidget>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<PostComments> postsList = [];
  List<Todo> todosList = [];
  List<Album> albumsList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);
    postsList = widget.ptacOfUser.postComments;
    todosList = widget.ptacOfUser.todos;
    albumsList = widget.ptacOfUser.albums;
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.book_outlined,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Tab(
              icon: Icon(Icons.schedule_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Tab(
              icon: Icon(Icons.photo_album,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
        Center(
          child: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: postsList.length,
              itemBuilder: (context, int index) {
                PostComments postInfo = postsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: PostTileWidget(
                    postInfo: postInfo,
                    showUsername: false,
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: todosList.length,
              itemBuilder: (context, int index) {
                Todo todoInfo = todosList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(todoInfo.title),
                    trailing: Checkbox(
                      value: todoInfo.completed,
                      onChanged: (bool? value) {},
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: albumsList.length,
              itemBuilder: (context, int index) {
                Album albumInfo = albumsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AlbumTileWidget(albumInfo: albumInfo,),
                );
              },
            ),
          ][_tabController.index],
        ),
      ],
    );
  }
}
