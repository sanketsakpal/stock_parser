import 'package:flutter/material.dart';
import 'package:stock_scan_parser/models/stock_parser_data_model.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/resources/font_manager.dart';
import 'package:stock_scan_parser/resources/routes_manager.dart';
import 'package:stock_scan_parser/resources/value_manager.dart';
import 'package:stock_scan_parser/widgets/back_ground_container.dart';
import 'package:stock_scan_parser/widgets/number_highlight_in_sentence.dart';

class StockParserDetailScreen extends StatelessWidget {
  const StockParserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)?.settings.arguments as StockParserDataModel?;
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
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ColoredBox(
                    color: ColorManager.blueColor,
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        argument?.name ?? "",
                        style: TextStyle(
                          color: ColorManager.whiteColor,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.bold,
                        ),
                      ),
                      subtitle: Text(
                        argument?.tag ?? "",
                        style: TextStyle(
                          color: argument?.tag == "Bullish" ||
                                  argument?.tag == "Intraday Bullish"
                              ? ColorManager.greenColor
                              : ColorManager.redColor,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppHeight.h12),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: argument?.criteria?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppHeight.h10,
                          ),
                          child: NumberHighlightText(
                            sentence: argument?.criteria?[index].text ?? "",
                            onTap: (String? val) {
                              if (val != null &&
                                  argument?.criteria?[index].type ==
                                      "indicator") {
                                getListValue(val, argument, index, context);
                              }
                              if (getListValue(
                                        val,
                                        argument,
                                        index,
                                        context,
                                      ) !=
                                      null &&
                                  getListValue(val, argument, index, context)!
                                      .isNotEmpty) {
                                Navigator.of(context).pushNamed(
                                  RouteNames.criteriaVariableDetail,
                                  arguments: {
                                    "values": getList(
                                      getListValue(
                                            val,
                                            argument,
                                            index,
                                            context,
                                          ) ??
                                          [],
                                    ),
                                  },
                                );
                              }
                            },
                          ),
                        );
                      },
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

List<num> getList(List<num> value) {
  final List<num> test = [];

  for (final element in value) {
    test.add(element);
  }
  return test;
}

List<num>? getListValue(String? val, StockParserDataModel? argument, int index,
    BuildContext context) {
  List<num>? variableListData;
  if (val != null) {
    if (val.contains('\$1') &&
        argument!.criteria![index].variable?.the1?.type == "value") {
      variableListData = argument.criteria![index].variable?.the1?.values;
    } else if (val.contains('\$1') &&
        argument!.criteria![index].variable?.the1?.type == "indicator") {
      Navigator.of(context).pushNamed(
        RouteNames.criteriaVariablePeriodDetail,
        arguments: argument.criteria![index].variable?.the1,
      );
    } else if (val.contains('\$2') &&
        argument!.criteria![index].variable?.the2?.type == "indicator") {
      Navigator.of(context).pushNamed(
        RouteNames.criteriaVariablePeriodDetail,
        arguments: argument.criteria![index].variable?.the2,
      );
    } else if (val.contains('\$3') &&
        argument!.criteria![index].variable?.the3?.type == "indicator") {
      Navigator.of(context).pushNamed(
        RouteNames.criteriaVariablePeriodDetail,
        arguments: argument.criteria![index].variable?.the3,
      );
    } else if (val.contains('\$4') &&
        argument!.criteria![index].variable?.the4?.type == "indicator") {
      Navigator.of(context).pushNamed(
        RouteNames.criteriaVariablePeriodDetail,
        arguments: argument.criteria![index].variable?.the4,
      );
    } else if (val.contains('\$2') &&
        argument!.criteria![index].variable?.the2?.type == "value") {
      variableListData = argument.criteria![index].variable?.the2!.values;
    } else if (val.contains('\$3')) {
      variableListData = argument!.criteria![index].variable?.the3!.values;
    } else if (val.contains('\$4')) {
      variableListData = argument!.criteria![index].variable?.the4!.values;
    }
  }
  return variableListData;
}
