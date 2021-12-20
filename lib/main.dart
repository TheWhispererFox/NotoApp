import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:noto_app/utils/round_underline_tab_indicator.dart';
import 'components/note_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Noto App',
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF1f1d2a),
              elevation: 0,
              bottom: const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Color(0xFF868591),
                  labelColor: Color(0xFFf3c060),
                  indicator: RoundUnderlineTabIndicator(
                    borderSide: BorderSide(color: Color(0xFFF3C060), width: 5),
                  ),
                  tabs: [Tab(text: 'All'), Tab(text: 'Folders')]),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
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
                        children: const <Widget>[
                          NoteCard(
                              color: Color(0xFF262635),
                              title: 'Quote Today',
                              content: Text(
                                  '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
                                  style: TextStyle(color: Color(0xFF7b7c8b)))),
                        ]),
                  )
                ],
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
              ),
            ),
            backgroundColor: const Color(0xFF1f1d2a),
          ),
        ));
  }
}
