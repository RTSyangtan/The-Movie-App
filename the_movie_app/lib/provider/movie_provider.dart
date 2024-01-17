
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/services/movie_services.dart';

final movieProvider = FutureProvider.family(
        (ref,String apiPath) => MovieServices.getMovie(apiPath: apiPath));
final videoProvider = FutureProvider.family(
        (ref,int id) => MovieServices.getVideo(id: id));