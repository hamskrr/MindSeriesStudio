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
      child: Image(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,image: NetworkImage(widget.image),fit: BoxFit.cover,),
    );
  }
}
