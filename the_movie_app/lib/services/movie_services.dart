import 'package:dio/dio.dart';
import '../constants/api.dart';
import '../model/movie.dart';
import '../model/video.dart';

class MovieServices{
  static final dio = Dio(
    BaseOptions(
        headers: {
          'Authorization':'Bearer your api here'
        }
    ));

  static Future<List<Movie>> getMovie({required String apiPath}) async{
    try{
      final response = await dio.get(apiPath);
      return (response.data['results']as List).map((e) => Movie.fromJson(e)).toList();
    }on DioException catch(err){
      throw'${err.message}';
    }
  }
  static Future<List<Video>> getVideo({required int id}) async{
    try{
      final response = await dio.get('${Api.baseUrl}/movie/$id/videos');
      return (response.data['results']as List).map((e) => Video.fromJson(e)).toList();
    }on DioException catch(err){
      throw'${err.message}';
    }
  }
  static Future<List<Movie>> getSearch({required String searchText}) async{
    try{
      final response = await dio.get('${Api.getSearchMovie}',queryParameters:
      {
        'query' : searchText
      });
      if((response.data['results'] as List).isEmpty){
        throw 'Please provide another key word';
      }else{
        return (response.data['results']as List).map((e) => Movie.fromJson(e)).toList();
      }
    }on DioException catch(err){
      throw'${err.message}';
    }
  }
  static Future<List<Movie>> getRecomended({required int id}) async{
    try {
      final response = await dio.get('${Api.baseUrl}/movie/$id/recommendations');
      return (response.data['results']as List).map((e) => Movie.fromJson(e)).toList();
    }on DioException catch(err) {
      throw'${err.message}';
    }
    }
}
