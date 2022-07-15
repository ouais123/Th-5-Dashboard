import 'package:flutter/material.dart';

const int smallScreenSize = 360;
const int samllMediumScreenSize = 532;
const int mediumScreenSize = 768;
const int mediumLatgeScreenSize = 1080;
const int largeScreenSize = 1366;

bool isSmall(BuildContext context) =>
    MediaQuery.of(context).size.width >= smallScreenSize &&
    MediaQuery.of(context).size.width < samllMediumScreenSize;

bool isSmallMedium(BuildContext context) =>
    MediaQuery.of(context).size.width >= samllMediumScreenSize &&
    MediaQuery.of(context).size.width < mediumScreenSize;

bool isMedium(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumScreenSize &&
    MediaQuery.of(context).size.width < mediumLatgeScreenSize;

bool isMediumLarge(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumLatgeScreenSize &&
    MediaQuery.of(context).size.width < largeScreenSize;

bool isLarge(BuildContext context) =>
    MediaQuery.of(context).size.width >= largeScreenSize;
