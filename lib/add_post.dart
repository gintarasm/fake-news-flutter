import 'package:flutter/material.dart';
import 'src/service/PostApi.dart';

class AddPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddPostFormState();
}

class AddPostFormState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = Map();

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
                        return 'Please enter post body';
                      }
                    },
                    onSaved: (value) {
                      _data['body'] = value;
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
                              add(_data['title'], _data['body'])
                                  .then((post) {
                                Navigator.pop(context);
                              });
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
