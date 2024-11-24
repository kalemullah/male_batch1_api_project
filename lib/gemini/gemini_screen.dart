import 'package:apitesting/gemini/gemini_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeminiScreen extends StatefulWidget {
  const GeminiScreen({super.key});

  @override
  State<GeminiScreen> createState() => _GeminiScreenState();
}

class _GeminiScreenState extends State<GeminiScreen> {
  TextEditingController prompt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GeminiProvider(),
      child: Consumer<GeminiProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Gemini'),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: prompt,
                      decoration: InputDecoration(
                        hintText: 'Enter text',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        model.geminiresponse(prompt.text.trim().toString());
                        prompt.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.teal,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
