import 'package:flutter/material.dart';
import 'package:tesla_animation_flutter/constrant.dart';

class BatteryStatus extends StatelessWidget {
  BatteryStatus({
    Key? key,
    required this.constraints,
  }) : super(key: key);
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "220 mi",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        Text(
          "62%",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Spacer(),
        Text(
          "Charging".toUpperCase(),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "18 min remaining",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * .14,
        ),
        DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("22 mi/hr"),
                Text("232 v"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
