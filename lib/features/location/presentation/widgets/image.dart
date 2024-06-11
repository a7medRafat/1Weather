import 'package:flutter/cupertino.dart';

class Img extends StatelessWidget {
  const Img({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: MediaQuery.of(context).size.height / 2,
      img,
      fit: BoxFit.cover,
    );
  }
}
