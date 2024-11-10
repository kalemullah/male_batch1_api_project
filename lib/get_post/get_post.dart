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
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('${snapshot.data![index].title}'),
                              subtitle: Text('${snapshot.data![index].body}'),
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
