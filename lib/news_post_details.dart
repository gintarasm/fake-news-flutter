import 'package:flutter/material.dart';
import 'src/domain/Post.dart';

class NewsPostDetails extends StatelessWidget {
  final Post post;

  NewsPostDetails(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake News'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                  child: Text(
                    post.title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                )),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      post.body,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
