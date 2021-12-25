import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/data/repositories/firestore/firestore_note_repository.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMM').format(note.createdAt);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        onTap: () {
          final FirestoreNoteRepository repo = locator.get();
          repo.update(
            note.rebuild(
              (b) => b..content = Random().nextInt(9999).toString(),
            ),
          );
        },
        child: Card(
          elevation: 0,
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  note.title ?? 'Untitled',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'MontserratAlternates',
                  ),
                ),
                Text(
                  note.content ?? '',
                ),
                Row(
                  children: [
                    Text(
                      formattedDate,
                    ),
                    const Spacer(),
                    const Text(
                      'Quote',
                      style: TextStyle(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
