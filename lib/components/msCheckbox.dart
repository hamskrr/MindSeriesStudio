import 'package:flutter/material.dart';

class MSCheckbox extends StatefulWidget {
  final Function(bool) onChecked;
  final String label;
  const MSCheckbox({Key? key, required this.onChecked , required this.label}) : super(key: key);

  @override
  State<MSCheckbox> createState() => _MSCheckboxState();
}

class _MSCheckboxState extends State<MSCheckbox> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
          children: [
            Expanded(
              flex:1,
              child: Checkbox(
                  value: isChecked,
                  visualDensity: VisualDensity.compact,
                  fillColor: MaterialStateProperty.all(
                      Colors.orange),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(100)),
                  onChanged: (click) {
                    print(click);
                    setState(() {
                      isChecked = !isChecked;
                    });
                    widget.onChecked(isChecked);
                  }),
            ),

            Expanded(
              flex: 5,
              child: Container(
                constraints:  BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.6),
                child: Text(
                 widget.label,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Cabin',
                    color: Colors.white,
                  ),),
              ),
            ),
          ]),
    );
  }
}
