import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ground.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
