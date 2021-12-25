import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/ui/constants.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMM').format(note.createdAt);
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(CreateNoteViewRoute(note: note));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: Container(
          padding: defaultPadding,
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
    );
  }
}
