
import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import '../models/albums_model/albums_model.dart';
import '../models/user_model/user_model.dart';
import '../pages/album_detail_page.dart';
import '../pages/user_detail_page.dart';

class AlbumTileWidget extends StatelessWidget {
  const AlbumTileWidget({super.key, required this.albumInfo});
  final Album albumInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  AlbumDetailPage(album: albumInfo))),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          title: Text(
            '${albumInfo.id}.${albumInfo.title}',
            style: TextStyle(fontSize: 16.0),
          )
        ),
      ),
    );
  }
}
