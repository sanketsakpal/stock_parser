import 'package:flutter/material.dart';

import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/resources/value_manager.dart';

class BackGroundContainer extends StatelessWidget {
  final Widget child;
  const BackGroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Container(
        width: double.infinity,
        color: ColorManager.blackColor,
        child: child,
      ),
    );
  }
}
