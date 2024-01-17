
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/model/movie.dart';
import 'package:the_movie_app/services/movie_services.dart';

final searchMovieProvider = AsyncNotifierProvider(()=>SearchMovie());

class SearchMovie extends AsyncNotifier {

  @override
  Future<List<Movie>> build() async{
    return [];
  }

  Future<void> getSearchData(String searchText) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => MovieServices.getSearch(searchText: searchText));
  }
}
