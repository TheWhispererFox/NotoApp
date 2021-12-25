import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({Key? key}) : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: const Icon(Icons.navigate_before_outlined),
        ),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter title of note here',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter note here',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
