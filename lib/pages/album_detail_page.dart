import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/models/albums_model/albums_model.dart';
import 'package:flutter_jsonplaceholder/models/comments_model/comments_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import 'package:flutter_jsonplaceholder/providers/ptac_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/albums_model/photos_model.dart';

class AlbumDetailPage extends ConsumerWidget {
  const AlbumDetailPage({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(photosDataProvider(album.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('${album.title}'),
      ),
      body: data.when(
          data: (data) {
            List<Photo> photosList = data.map((e) => e).toList();
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: photosList.length,
              itemBuilder: (BuildContext context, int index) {
                Photo photo = photosList[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: (){
                      _displayBottomSheet(context,photo.url,photo.title);
                    },
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(photo.thumbnailUrl)),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(1, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }

  Future _displayBottomSheet(BuildContext context,String url, String title) {
    return showModalBottomSheet(
        context: context,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        builder: (context) {
          return Container(
            height: 400,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 300,
                    width:300,
                    child: CachedNetworkImage(
                      imageUrl: url,
                      placeholder: (context, url) => new CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                  Text(title)
                ],
              ),
            ),
          );
        });
  }
}
