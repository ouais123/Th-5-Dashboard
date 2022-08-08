import 'package:dashboard/controllers/drivers_controller.dart';
import 'package:dashboard/models/driver.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemDriver extends StatelessWidget {
  ItemDriver({
    Key? key,
    required this.driver,
    required this.index,
  }) : super(key: key);

  final DriversController driversController = Get.find();
  final Driver driver;
  final int index;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => driversController.indexHover.value = index,
      onExit: (_) => driversController.indexHover.value = -1,
      child: Obx(
        () => Container(
          color: driversController.indexHover.value == index
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
                        child: buildItemRow("${driver.id}"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.2,
                        child: buildItemRow(driver.name),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.2,
                        child: buildItemRow(driver.phone),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.2,
                        child: buildItemRow(driver.email),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    25.r,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Accepts"),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.02,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    25.r,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(" Reject "),
                            ),
                          ],
                        ),
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
