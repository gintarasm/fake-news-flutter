import 'package:flutter/material.dart';
import 'src/domain/Post.dart';
import 'news_post_details.dart';

class NewsPostItem extends StatelessWidget {
  Post post;

  NewsPostItem(this.post);

  void _navigateToDetails(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return NewsPostDetails(post);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                post.title,
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  post.content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
