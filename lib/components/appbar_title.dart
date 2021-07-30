import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarTitle {
  AppbarTitle({@required this.imgUrl,@required this.label });
  final String imgUrl;
  final String label;
  Widget getAppbarTitle() {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 24,
        height: 24,
        child: SvgPicture.asset(imgUrl),
      ),
      SizedBox(
        width: 10.0,
      ),
      Container(
        child: Text(label),
      )
    ],
  ));
}
}
