import 'package:flutter/material.dart';
import 'src/domain/Post.dart';

class AddPost extends StatefulWidget {
  void Function(Post) _handleAddPost;

  AddPost(this._handleAddPost);

  @override
  State<StatefulWidget> createState() => AddPostFormState(_handleAddPost);
}

class AddPostFormState extends State<AddPost> {
  final void Function(Post) _handleAddPost;
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = Map();

  AddPostFormState(this._handleAddPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Post'),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter post title';
                      }
                    },
                    onSaved: (value) {
                      _data['title'] = value;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter post content';
                      }
                    },
                    onSaved: (value) {
                      _data['content'] = value;
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'Post',
                            style: Theme.of(context).primaryTextTheme.button,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _handleAddPost(Post(
                                  id: 5,
                                  title: _data['title'],
                                  content: _data['content']));
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ))
                    ],
                  )
                ],
              ),
            )));
  }
}
