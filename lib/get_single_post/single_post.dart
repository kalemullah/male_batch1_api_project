import 'package:apitesting/get_single_post/single_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({super.key});

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SinglePostProvider(),
      child: Consumer<SinglePostProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            children: [
              Text('Single Post'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: searchController,
                      decoration: InputDecoration(hintText: 'search by id'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      model.getSinglePostData(
                          int.parse(searchController.text.toString()));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text('search')),
                    ),
                  )
                ],
              ),
              Text('title: ${model.singlePostModel.title}'),
              Text('description: ${model.singlePostModel.body}')
            ],
          ),
        ),
      ),
    );
  }
}
