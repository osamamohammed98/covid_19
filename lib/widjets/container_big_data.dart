import 'package:flutter/material.dart';

import '../constant.dart';
class ContainerBigData extends StatelessWidget {
  final Color color;
  final int number;
  final String title;

  const ContainerBigData({
    Key key,
    this.color,
    this.number,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${number}",
          style: TextStyle(
            fontSize: 25,
            color: color,
          ),
        ),
        Text(
          "${title}",
          style: kSubTextStyle,
        ),
      ],
    );
  }
}
class MyClicpper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    //todo this for height ES
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
