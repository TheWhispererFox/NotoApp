import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noto_app/app/app.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:noto_app/domain/notes/notes_state.dart';
import 'package:noto_app/ui/components/note_card.dart';
import 'package:noto_app/utils/extensions/context_extension.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';

import 'package:rxdart/rxdart.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabController = useTabController(initialLength: 2);

    final _notesBloc = ref.watch(notesBlocProvider);

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
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            const Text(
              'Notes',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const Spacer(),
            _notesBloc.stateStream.builderNoLoading(
              onData: (context, state) {
                if (state.selectedNotes.isEmpty) {
                  return Row(
                    children: [
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
                          AutoRouter.of(context)
                              .push(const SettingsPageRoute());
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.settings,
                          size: 24.0,
                          semanticLabel: 'Settings',
                        ),
                      )
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _notesBloc.removeAllSelectedNotes();
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.delete,
                          size: 24.0,
                          semanticLabel: 'Delete selected',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _notesBloc.unselectAll();
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.remove_done,
                          size: 24.0,
                          semanticLabel: 'Unselect all',
                        ),
                      )
                    ],
                  );
                }
              },
            )
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.lang!.all),
            Tab(text: context.lang!.folders),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Rx.combineLatest2<BuiltList<Note>, NotesState, BuiltList<Note>>(
            _notesBloc.getNotes(),
            _notesBloc.stateStream,
            (notes, _) => notes,
          ).builderNoLoading(
            onData: (_, notes) {
              if (notes.isEmpty) {
                return const Center(
                  child: Text("No notes.\nAdd new notes to become better."),
                );
              } else {
                final sortedNotes = (notes.toList()
                      ..sort((a, b) => b.createdAt.compareTo(a.createdAt)))
                    .toBuiltList();

                return GridView.builder(
                  itemCount: sortedNotes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemBuilder: (context, index) {
                    final it = sortedNotes[index];
                    return NoteCard(
                      note: it,
                      isSelected: _notesBloc.isSelected(it),
                      onTap: _notesBloc.isInSelectionMode
                          ? () {
                              _notesBloc.select(it);
                            }
                          : () {
                              AutoRouter.of(context)
                                  .push(CreateNotePageRoute(note: it));
                            },
                      onLongPress: () {
                        _notesBloc.select(it);
                      },
                      onSelectionChanged: (_) {
                        _notesBloc.select(it);
                      },
                    );
                  },
                );
              }
            },
          ),
          Container()
        ],
      ),
    );
  }
}
