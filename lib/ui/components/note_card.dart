import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/ui/components/card.dart' as local;

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMM').format(note.createdAt);
    return local.Card(
      color: Theme.of(context).cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            note.title ?? 'Untitled',
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: 'MontserratAlternates',
              color: Color(0xFFeeeff0),
            ),
          ),
          Text(
            note.content ?? '',
            style: const TextStyle(color: Color(0xFF868591)),
          ),
          Row(
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  color: Color(0xFF7b7c8b),
                ),
              ),
              const Spacer(),
              const Text(
                'Quote',
                style: TextStyle(
                  color: Color(0xFF7b7c8b),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
