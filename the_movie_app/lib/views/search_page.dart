
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie_app/provider/search_movie_provider.dart';

import 'detail_page.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(searchMovieProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onFieldSubmitted: (val){
                  if(val.isEmpty){

                  }else{
                    ref.read(searchMovieProvider.notifier).getSearchData(val);
                  }
              },
            ),
            Expanded(
                child: state.when(
                    data: (data){
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            itemCount: data.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2/3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemBuilder: (context,index){
                              final movie = data[index];
                              return InkWell(
                                  onTap: (){
                                    Get.to(()=>DetailPage(movie: movie));
                                  },
                                  child: Image.network(movie.poster_path));
                            }
                        ),
                      );
                    },
                    error: (err,st){
                      return Text('$err');
                    },
                    loading: (){
                      return CircularProgressIndicator();
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}

