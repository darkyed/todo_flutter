import 'package:flutter/material.dart';


class EmptyListDisplay extends StatelessWidget {
  const EmptyListDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        foregroundDecoration: BoxDecoration(
          color: Colors.grey,
          backgroundBlendMode: BlendMode.saturation,
        ),
        child: Image(
          image: AssetImage('assets/list_roll.png'),
          height: 300.0,
        ),
      ),
    );
  }
}
