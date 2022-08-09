import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/views/pages/overview/overview_large_page.dart';
import 'package:dashboard/views/pages/overview/overview_medium_large_page.dart';
import 'package:dashboard/views/pages/overview/overview_medium_page.dart';
import 'package:dashboard/views/pages/overview/overview_small_medium_page.dart';
import 'package:dashboard/views/pages/overview/overview_small_page.dart';
import 'package:dashboard/views/widgets/app/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverViewPage extends StatefulWidget {
  const OverViewPage({Key? key}) : super(key: key);

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage>
    with AutomaticKeepAliveClientMixin {
  final OverViewController overViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => overViewController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ResponsiveWidget(
              large: OverViewLargePage(),
              mediumLarge: OverViewMediumLargePage(),
              medium: OverViewMediumPage(),
              smallMedium: OverViewSmallMediumPage(),
              small: OverViewSmallPage(),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
