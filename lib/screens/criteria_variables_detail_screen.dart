import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/resources/font_manager.dart';
import 'package:stock_scan_parser/resources/value_manager.dart';
import 'package:stock_scan_parser/widgets/back_ground_container.dart';

class CriteriaVariableDetailScreen extends StatelessWidget {
  const CriteriaVariableDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stock Parser",
          style: TextStyle(
            fontSize: FontSize.s18,
            fontWeight: FontWeightManager.bold,
          ),
        ),
      ),
      body: Center(
        child: BackGroundContainer(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: AppPadding.p14),
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: const Divider(
                  color: ColorManager.whiteColor,
                ),
              );
            },
            itemCount: (argument?['values'] as List).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: AppPadding.p16, bottom: 10.h),
                child: Text(
                  // ignore: avoid_dynamic_calls
                  "${argument!["values"][index]}",
                  style: TextStyle(
                    color: ColorManager.whiteColor,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
