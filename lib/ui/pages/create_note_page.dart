import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/domain/create_note/create_note_bloc.dart';
import 'package:noto_app/ui/constants.dart';
import 'package:noto_app/utils/extensions/extensions.dart';

class CreateNotePage extends HookWidget {
  const CreateNotePage({Key? key, required this.note}) : super(key: key);

  final Note? note;

  @override
  Widget build(BuildContext context) {
    final CreateNoteBloc _bloc = useMemoized(() => CreateNoteBloc(note));
    useEffect(() => _bloc.dispose);

    final _contentController =
        useTextEditingController(text: _bloc.state.note.content);
    final _titleController =
        useTextEditingController(text: _bloc.state.note.title);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _bloc.updateState(
                (b) => b..isRenderMode = !_bloc.state.isRenderMode,
              );
            },
            icon: const Icon(Icons.text_format),
          ),
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
                Expanded(
                  child: _bloc.stateStream
                      .map((s) => s.isRenderMode)
                      .builderNoLoading(
                    onData: (context, isRenderMode) {
                      if (isRenderMode) {
                        return _bloc.stateStream
                            .map((s) => s.note.content)
                            .builderNoLoading(
                          onData: (context, data) {
                            return Markdown(data: data ?? "");
                          },
                        );
                      } else {
                        return TextFormField(
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter note here',
                          ),
                          controller: _contentController,
                          onChanged: (value) =>
                              _bloc.updateState((b) => b..note.content = value),
                        );
                      }
                    },
                  ),
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
