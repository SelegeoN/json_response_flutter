
import 'package:flutter_jsonplaceholder/api/post_todo_alboms_api.dart';
import 'package:flutter_jsonplaceholder/models/albums_model/photos_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/p_t_a_c_user_model.dart';
import 'package:flutter_jsonplaceholder/models/post_model/post_comments_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final postsDataProvider = FutureProvider<List<PostComments>>((ref) async {
  return ref.watch(ptacProvider).getAllPosts();
});


final ptacDataProvider = FutureProvider.family<PTACOfUser, int>((ref, id) {
  return ref.watch(ptacProvider).getAllUserResources(id: id);
});

final photosDataProvider = FutureProvider.family<List<Photo>, int>((ref, id) {
  return ref.watch(ptacProvider).getAllAlbumPhotos(id: id);
});