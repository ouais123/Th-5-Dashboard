import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/views/widgets/app/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage({Key? key}) : super(key: key);
  final OverViewController overViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      large: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF282828),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(),
          ),
        ],
      ),
      small: Container(
        constraints: const BoxConstraints.expand(),
      ),
    );
  }
}
