import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noto_app/data/models/note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.onTap,
    this.onLongPress,
    required this.isSelected,
    required this.onSelectionChanged,
  }) : super(key: key);

  final Note note;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool isSelected;
  final void Function(bool?) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMM').format(note.createdAt);
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.all(12),
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
                  const Spacer(),
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
          Positioned(
            right: 0,
            top: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isSelected
                  ? Checkbox(
                      value: isSelected,
                      onChanged: onSelectionChanged,
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
