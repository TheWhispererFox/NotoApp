import 'package:flutter/cupertino.dart';
import 'card.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.content})
      : super(key: key);

  final Color? color;
  final String title;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'MontserratAlternates',
                  color: Color(0xFFeeeff0))),
          content,
          Row(
            children: const [
              Text('19 jan', style: TextStyle(color: Color(0xFF7b7c8b))),
              Spacer(),
              Text('Quote', style: TextStyle(color: Color(0xFF7b7c8b)))
            ],
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
