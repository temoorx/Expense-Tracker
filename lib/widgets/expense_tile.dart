import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final String amount;
  final DateTime dateTime;
  final void Function(BuildContext context)? deleteTapped;
  const ExpenseTile(
      {super.key,
      required this.title,
      required this.amount,
      required this.dateTime,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          label: 'Delete',
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(4),
          onPressed: deleteTapped,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(right: 3.0, left: 3.0, bottom: 5.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: <Color>[
              Colors.black,
              Colors.black12,
            ]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(title),
            subtitle:
                Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
            trailing: Text(
              '\$$amount',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
