import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;

bool isSmall(BuildContext context) =>
    MediaQuery.of(context).size.width < mediumScreenSize;

bool isMedium(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumScreenSize &&
    MediaQuery.of(context).size.width < largeScreenSize;

bool isLarge(BuildContext context) =>
    MediaQuery.of(context).size.width >= largeScreenSize;
