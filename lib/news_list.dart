import 'package:flutter/material.dart';
import 'src/domain/Post.dart';
import 'news_post_item.dart';
import 'add_post.dart';


class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListSate();
}

class _NewsListSate extends State<NewsList> {
  final posts = [
    Post(
        id: 1,
        title: 'Trump says ‘Fake News is going crazy’ after Putin summit',
        content:
        'A defiant President Donald Trump on Tuesday defended his meeting with Vladimir Putin, saying it went “even better” than his contentious summit with NATO leaders last week.'),
    Post(
        id: 2,
        title: 'Politicians are using fake news schemes to get elected',
        content:
        'Media manipulation has always been a part of the political playbook, but technology has enabled politicians to take the practice a step further by changing or mimicking real stories and news outlets to mislead voters.'),
    Post(
        id: 3,
        title: 'Facebook refuses to remove fake news, but will demote it',
        content:
        'In the name of free speech, Facebook said, it’s keeping all the bilge water, be it pumped out by the right or left… though the platform intends to push fakery down deeper into the holding tank by demoting it.'),
  ];

  void _handleAddPost(Post post) {
   setState(() {
     posts.insert(0, post);
   });
  }

  void _addPost(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return AddPost(_handleAddPost);
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
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        if (posts.length <= index) {
          return null;
        }
        return new NewsPostItem(posts[index]);
      }),
    );
  }

}