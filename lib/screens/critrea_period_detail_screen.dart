import 'package:flutter/material.dart';

import 'package:stock_scan_parser/models/stock_parser_data_model.dart';

import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/resources/font_manager.dart';
import 'package:stock_scan_parser/resources/value_manager.dart';
import 'package:stock_scan_parser/widgets/back_ground_container.dart';

class CriteriaPeriodDetailScreen extends StatefulWidget {
  const CriteriaPeriodDetailScreen({super.key});

  @override
  State<CriteriaPeriodDetailScreen> createState() =>
      _CriteriaPeriodDetailScreenState();
}

class _CriteriaPeriodDetailScreenState
    extends State<CriteriaPeriodDetailScreen> {
  TextEditingController periodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments! as VariableData1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stock Parser",
          style: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.bold,
          ),
        ),
      ),
      body: Center(
        child: BackGroundContainer(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${argument.studyType}".toUpperCase(),
                    style: TextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  SizedBox(
                    height: AppHeight.h12,
                  ),
                  Text(
                    "Set Parameter",
                    style: TextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  SizedBox(
                    height: AppHeight.h10,
                  ),
                  ColoredBox(
                    color: ColorManager.whiteColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(AppPadding.p8),
                            child: Text(
                              argument.parameterName.toString(),
                              style: TextStyle(
                                color: ColorManager.blackColor,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: AppHeight.h30,
                              top: AppHeight.h14,
                              right: AppWidth.w16,
                            ),
                            child: TextFormField(
                              initialValue: argument.defaultValue.toString(),
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
