import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/profileProvider.dart';

class ProfileAvatar extends StatelessWidget {
  final double? radius;
  final String? image;
  final bool border;
  final double? borderWidth;
  final Color? borderColor;
  const ProfileAvatar({this.image, this.border = true, this.radius = 50,this.borderWidth,this.borderColor,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border ? Border.all(color: borderColor ?? Colors.orange,width: borderWidth??2): null,
        image: DecorationImage(
          image: NetworkImage(image??Provider.of<ProfileProvider>(context).currentProfile?.picture??"https://www.formica.com/en-ie/-/media/formica/emea/products/swatch-images/f2253/f2253-swatch.jpg"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
