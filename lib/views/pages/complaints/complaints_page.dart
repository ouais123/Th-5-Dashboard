import 'package:dashboard/controllers/complaints_conttroler.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:dashboard/views/widgets/complaints/item_complaint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({Key? key}) : super(key: key);

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage>
    with AutomaticKeepAliveClientMixin {
  final ComplaintsConttroler complaintsConttroler = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 40.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).colorScheme.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(
              "Complaints",
              maxLines: 1,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: "Raleway",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SelectableText(
              "Sort by most recent by date",
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              color: Theme.of(context).colorScheme.border,
              thickness: 0.8.h,
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              color: Colors.white,
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
                      child: const Text(
                        "Driver Id",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth * 0.2,
                      child: const Text(
                        "Driver Name",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth * 0.1,
                      child: const Text(
                        "User Id",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth * 0.2,
                      child: const Text(
                        "User Name",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth * 0.4,
                      child: const Text(
                        "Content",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => complaintsConttroler.isLoading.value
                  ? const Center(
                      child: LinearProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: complaintsConttroler.complaints.length,
                      itemBuilder: (context, index) => ItemComplaint(
                        complaints: complaintsConttroler.complaints[index],
                        index: index,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
