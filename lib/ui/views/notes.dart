import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/ui/components/note_card.dart';
import 'package:noto_app/utils/constants.dart' as constants;
import 'package:noto_app/utils/round_underline_tab_indicator.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Note> notes = [
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr. \n A Loooooooooooooooooooooooooooooooooooooooooong cat',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr. \n A very Loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong cat',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
      ),
      Note(
        title: 'Quote Today',
        content:
            '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
      ),
    ];
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: MasonryGrid(
                  //primary: false,
                  //padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  column: 2,
                  //crossAxisCount: 2,
                  children: notes.map((e) => NoteCard(note: e)).toList(),
                ),
              )
            ],
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF1f1d2a),
      ),
    );
  }
}
