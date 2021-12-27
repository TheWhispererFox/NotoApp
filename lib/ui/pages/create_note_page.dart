import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/domain/create_note/create_note_bloc.dart';
import 'package:noto_app/ui/constants.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key, required this.note}) : super(key: key);

  final Note? note;

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNotePage> {
  late final CreateNoteBloc _bloc;
  late TextEditingController _contentController;
  late TextEditingController _titleController;

  @override
  void dispose() {
    _bloc.dispose();
    _contentController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bloc = CreateNoteBloc(widget.note);
    _titleController = TextEditingController(text: _bloc.state.note.title);
    _contentController = TextEditingController(text: _bloc.state.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                onTap: () {
                  _bloc.deleteNote();
                },
                child: const Text("Delete"),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                AutoRouter.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: defaultPadding,
        child: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter title of note here',
                  ),
                  controller: _titleController,
                  onChanged: (value) =>
                      _bloc.updateState((b) => b..note.title = value),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter note here',
                  ),
                  controller: _contentController,
                  onChanged: (value) =>
                      _bloc.updateState((b) => b..note.content = value),
                ),
                ElevatedButton(
                  onPressed: () {
                    _bloc.saveNote();
                    AutoRouter.of(context).pop();
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
