import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/views/pages/overview/overview_large_page.dart';
import 'package:dashboard/views/pages/overview/overview_medium_large_page.dart';
import 'package:dashboard/views/pages/overview/overview_medium_page.dart';
import 'package:dashboard/views/pages/overview/overview_small_medium_page.dart';
import 'package:dashboard/views/pages/overview/overview_small_page.dart';
import 'package:dashboard/views/widgets/app/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage({Key? key}) : super(key: key);
  final OverViewController overViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      large: OverViewLargePage(),
      mediumLarge: OverViewMediumLargePage(),
      medium: OverViewMediumPage(),
      smallMedium: OverViewSmallMediumPage(),
      small: OverViewSmallPage(),
    );
  }
}
