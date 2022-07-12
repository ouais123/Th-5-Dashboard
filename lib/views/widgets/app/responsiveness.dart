// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/core/functions/size.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget large;
  final Widget? medium;
  final Widget? small;

  const ResponsiveWidget({
    Key? key,
    required this.large,
    this.medium,
    this.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isLarge(context))
        return large;
      else if (isMedium(context))
        return medium ?? large;
      else
        return small ?? large;
    });
  }
}
