import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:noto_app/ui/components/note_card.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> with TickerProviderStateMixin {
  late final NotesBloc _notesBloc;

  @override
  void initState() {
    super.initState();
    _notesBloc = context.read();
  }

  @override
  void dispose() {
    _notesBloc.dispose();
    _tabController.dispose();
    super.dispose();
  }

  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          AutoRouter.of(context).push(CreateNotePageRoute(note: null));
        },
        elevation: 10,
        child: const Icon(Icons.note_add_outlined),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: <Widget>[
            const Text(
              'Notes',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              splashRadius: 24,
              icon: const Icon(
                Icons.search_outlined,
                size: 24.0,
                semanticLabel: 'Search',
              ),
            ),
            IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const SettingsRoute());
              },
              splashRadius: 24,
              icon: const Icon(
                Icons.settings,
                size: 24.0,
                semanticLabel: 'Settings',
              ),
            )
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Folders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _notesBloc.getNotes().builderNoLoading(
            onData: (_, notes) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  final it = notes[index];
                  return NoteCard(
                    note: it,
                  );
                },
              );
            },
          ),
          Container()
        ],
      ),
    );
  }
}
