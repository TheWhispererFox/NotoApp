import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:noto_app/ui/components/note_card.dart';
import 'package:noto_app/utils/constants.dart' as constants;
import 'package:noto_app/ui/components/round_underline_tab_indicator.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final NotesBloc _notesBloc = context.read();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            AutoRouter.of(context).push(const CreateNoteViewRoute());
          },
          elevation: 10,
          backgroundColor: const Color(0xff6f70c2),
          child: const Icon(Icons.note_add_outlined),
        ),
        appBar: AppBar(
          backgroundColor: constants.backgroundColor,
          elevation: 0,
          title: Row(
            children: <Widget>[
              const Text(
                'Notes',
                style: TextStyle(
                  color: Color(0xfffffffe),
                  fontSize: 24.0,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(const Size(40, 35)),
                  foregroundColor: MaterialStateProperty.resolveWith(
                    constants.getColor,
                  ),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(const Size(40, 35)),
                  foregroundColor: MaterialStateProperty.resolveWith(
                    constants.getColor,
                  ),
                  splashFactory: NoSplash.splashFactory,
                ),
                icon: const Icon(
                  Icons.search_outlined,
                  size: 24.0,
                  semanticLabel: 'Search',
                ),
                label: const Text(''),
              ),
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(const Size(40, 35)),
                  foregroundColor: MaterialStateProperty.resolveWith(
                    constants.getColor,
                  ),
                  splashFactory: NoSplash.splashFactory,
                ),
                icon: const Icon(
                  Icons.pending_outlined,
                  size: 24.0,
                  semanticLabel: 'More',
                ),
                label: const Text(''),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Color(0xFF868591),
            labelColor: Color(0xFFf3c060),
            labelStyle: TextStyle(fontFamily: 'Roboto'),
            unselectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
            indicator: RoundUnderlineTabIndicator(
              borderSide: BorderSide(color: Color(0xFFF3C060), width: 5),
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Folders'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: _notesBloc.getNotes().builderNoLoading(
            onData: (_, notes) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MasonryGrid(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      column: 2,
                      children: notes
                          .map(
                            (it) => NoteCard(
                              note: it,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
              );
            },
          ),
        ),
        backgroundColor: const Color(0xFF1f1d2a),
      ),
    );
  }
}
