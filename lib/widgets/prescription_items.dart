import 'package:flutter/material.dart';

class PrescriptionItem extends StatefulWidget {
  String lastWords;
  bool expanded;
  String title;

  PrescriptionItem({this.lastWords, this.expanded, this.title});

  @override
  _PrescriptionItemState createState() => _PrescriptionItemState();
}

class _PrescriptionItemState extends State<PrescriptionItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon:
                  Icon(widget.expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  widget.expanded = !widget.expanded;
                });
              },
            ),
          ),
          if (widget.expanded)
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(widget.lastWords),
            ),
        ],
      ),
    );
  }
}
