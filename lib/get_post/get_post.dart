import 'package:apitesting/get_post/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetPost extends StatefulWidget {
  const GetPost({super.key});

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: Consumer<PostProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            children: [
              FutureBuilder(
                  future: model.getPostData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: model.postList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('${model.postList[index].title}'),
                              subtitle: Text('${model.postList[index].body}'),
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
