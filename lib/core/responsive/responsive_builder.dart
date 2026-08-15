import 'package:flutter/material.dart';
import 'breakpoints.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width <= Breakpoints.mobileMax) {
      return DeviceType.mobile;
    } else if (width <= Breakpoints.tabletMax) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= Breakpoints.mobileMax) {
          return mobile;
        } else if (constraints.maxWidth <= Breakpoints.tabletMax) {
          return tablet ?? mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
