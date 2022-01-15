import 'package:flutter/material.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/ui/components/note_card.dart';

Widget noteCard() => Center(
      child: SizedBox(
        height: 200,
        child: NoteCard(
          note: Note(content: "Content", title: "Title"),
          onTap: () {},
          isSelected: false,
          onSelectionChanged: (_) {},
        ),
      ),
    );
