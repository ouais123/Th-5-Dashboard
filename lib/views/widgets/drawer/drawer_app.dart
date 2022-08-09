import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/views/widgets/drawer/drawer_list_title.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerApp extends StatelessWidget {
  DrawerApp({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "$assetsImages/drawer-background.png",
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Container(
          color: const Color(0xFF282828).withOpacity(0.9),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  DrawerListTitle(
                    title: "OverView",
                    icon: Icons.moving_sharp,
                    onTap: () => homeController.changeIndex(0),
                    index: 0,
                  ),
                  DrawerListTitle(
                    title: "Driver",
                    icon: FluentIcons.vehicle_car_24_regular,
                    onTap: () => homeController.changeIndex(1),
                    index: 1,
                  ),
                  DrawerListTitle(
                    title: "Complaints",
                    icon: FluentIcons.people_swap_24_regular,
                    onTap: () => homeController.changeIndex(2),
                    index: 2,
                  ),
                  DrawerListTitle(
                    title: "Price",
                    icon: FluentIcons.money_24_regular,
                    onTap: () {
                      Get.dialog(Dialog(
                        child: SizedBox(
                          height: 260.h,
                          width: 50.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: "OpenSans",
                                  fontSize: 35.sp,
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: TextField(
                                  controller: homeController.priceController,
                                  decoration: InputDecoration(
                                    hintText: 'Price',
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    labelStyle: const TextStyle(fontSize: 12),
                                    contentPadding:
                                        const EdgeInsets.only(left: 30),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 236, 239, 241),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 236, 239, 241)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: ElevatedButton(
                                  onPressed: homeController.addPrice,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: Center(
                                      child: Text("Add Price"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                    index: 3,
                  ),
                  DrawerListTitle(
                    title: "Log Out",
                    icon: FluentIcons.sign_out_24_regular,
                    onTap: () async => await Get.offNamed("/login"),
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
