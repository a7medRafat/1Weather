import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('OR', style: Theme.of(context).textTheme.bodySmall),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
