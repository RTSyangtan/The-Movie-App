

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/provider/movie_provider.dart';
import 'package:the_movie_app/views/widgets/video_widget.dart';

import '../model/movie.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({super.key,required this.movie});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(videoProvider(movie.id));
    return Scaffold(
      body: Column(
        children: [
          state.when(
              data: (data){
                return PlayVideoFromYoutube(video: data[0]);
              },
              error: (err,st){
                return Text('$err');
              },
              loading: (){
                return CircularProgressIndicator();
              }
          ),
        ],
      ),
    );
  }
}
