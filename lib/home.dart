import 'package:blog/services/post_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';

class Home extends StatelessWidget{

  PostService service = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      body: FutureBuilder<List<Post>>(
        future: service.fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if(!snapshot.hasData){
             return const Center(
               child: CircularProgressIndicator(),
             );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data![index].title),
                    Text(snapshot.data![index].description)
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}