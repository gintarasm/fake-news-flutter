import 'package:flutter/material.dart';
import 'src/domain/Post.dart';
import 'src/service/PostApi.dart';
import 'news_post_item.dart';
import 'add_post.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListSate();
}

class _NewsListSate extends State<NewsList> {

  void _addPost(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return AddPost();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fake news'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addPost(context);
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: fetchAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final posts = snapshot.data;
                return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  if (posts.length <= index) {
                    return null;
                  }
                  return new NewsPostItem(posts[index]);
                });
              }

              return CircularProgressIndicator();
            }));
  }
}
