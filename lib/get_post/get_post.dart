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
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('${snapshot.data![index].name}'),
                              subtitle: Text(
                                  '${snapshot.data![index].company!.name}'),
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
