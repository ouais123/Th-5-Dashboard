import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              flex: 3,
              child: SelectableText("Car Go"),
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).colorScheme.divider,
          thickness: 0.8.h,
        ),
      ],
    );
  }
}
