import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:the_movie_app/views/widgets/tab_bar_widget.dart';
import 'package:the_movie_app/views/search_page.dart';

import '../constants/api.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('The Movie App'),
          actions:[
            IconButton(onPressed:(){
              Get.to(()=>SearchPage());
            }, icon: Icon(Icons.search),),
          ],
          bottom:  TabBar(
              tabs: [
                Tab(
                    text: 'Popular'
                ),
            Tab(
                text: 'TopRated'
            ),
            Tab(
                text: 'UpComming'
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            TabBarWidgets(api: Api.popularMovie),
            TabBarWidgets(api: Api.topRated),
            TabBarWidgets(api: Api.upComming),
          ],
        ),
      ),
    );
  }
}
