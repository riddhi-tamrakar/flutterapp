import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGImageWidget extends StatelessWidget {
  final String name;
  final Color color;
  final double height, width;
  SVGImageWidget({this.name, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        'assets/images/$name.svg',
        color: color,
      ),
    );
  }
}
