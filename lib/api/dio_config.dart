import 'package:dio/dio.dart';


// final Dio _dio = Dio(
//   BaseOptions(
//     baseUrl: 'https://jsonplaceholder.typicode.com',
//   ),
// );

class DioClient {
  final Dio dio = Dio();

  final String baseUrl = 'https://jsonplaceholder.typicode.com';
}