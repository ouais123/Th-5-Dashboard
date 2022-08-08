import 'package:dashboard/controllers/complaints_conttroler.dart';
import 'package:dashboard/models/complaints.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemComplaint extends StatelessWidget {
  ItemComplaint({
    Key? key,
    required this.complaints,
    required this.index,
  }) : super(key: key);
  final ComplaintsConttroler complaintsConttroler = Get.find();

  final Complaints complaints;
  final int index;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => complaintsConttroler.indexHover.value = index,
      onExit: (_) => complaintsConttroler.indexHover.value = -1,
      child: Obx(
        () => Container(
          color: complaintsConttroler.indexHover.value == index
              ? Colors.grey.withOpacity(0.25)
              : Colors.transparent,
          child: Column(
            children: [
              Container(
                color: index % 2 == 0
                    ? Colors.grey.withOpacity(0.15)
                    : Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 20.h,
                ),
                child: LayoutBuilder(
                  builder: (_, constraints) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.1,
                        child: buildItemRow("${complaints.driverId}"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.2,
                        child: buildItemRow(complaints.driverName),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.1,
                        child: buildItemRow("${complaints.userId}"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.2,
                        child: buildItemRow(complaints.userName),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.4,
                        child: buildItemRow(complaints.content),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                color: Theme.of(context).colorScheme.divider,
              ),
            ],
          ),
        ),
      ),
    );
  }

  LayoutBuilder buildItemRow(String text) {
    return LayoutBuilder(
      builder: (_, constraints) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.1,
        ),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: "OpenSans",
          ),
        ),
      ),
    );
  }
}
