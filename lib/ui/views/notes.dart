import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/ui/components/note_card.dart';
import 'package:noto_app/ui/components/round_underline_tab_indicator.dart';
import 'package:noto_app/utils/constants.dart' as constants;
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> with TickerProviderStateMixin {
  late final NotesBloc _notesBloc = context.read();

  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          AutoRouter.of(context).push(const CreateNoteViewRoute());
        },
        elevation: 10,
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
              onPressed: () {
                final themeBloc = context.read<ThemeBloc>();

                if (themeBloc.state.themeMode == ThemeMode.dark) {
                  themeBloc.events.setThemeMode(ThemeMode.light);
                } else {
                  themeBloc.events.setThemeMode(ThemeMode.dark);
                }
              },
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
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: const Color(0xFF868591),
          labelColor: const Color(0xFFf3c060),
          labelStyle: const TextStyle(fontFamily: 'Roboto'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Roboto'),
          indicator: const RoundUnderlineTabIndicator(
            borderSide: BorderSide(color: const Color(0xFFF3C060), width: 5),
          ),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Folders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
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
          Container(),
        ],
      ),
      backgroundColor: const Color(0xFF1f1d2a),
    );
  }
}
