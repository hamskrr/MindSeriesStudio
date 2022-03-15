import 'package:flutter/material.dart';

class MSImageViewer extends StatefulWidget {
  final String image;
  const MSImageViewer({required this.image , Key? key}) : super(key: key);

  @override
  _MSImageViewerState createState() => _MSImageViewerState();
}

class _MSImageViewerState extends State<MSImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: NetworkImage(widget.image)),
    );
  }
}
