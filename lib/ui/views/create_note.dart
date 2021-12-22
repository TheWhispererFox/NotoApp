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
      body: const Center(
        child: Text('TODO: Make note creation form'),
      ),
    );
  }
}
