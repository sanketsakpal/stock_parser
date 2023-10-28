import 'package:flutter/material.dart';
import 'package:stock_scan_parser/screens/criteria_variables_detail_screen.dart';
import 'package:stock_scan_parser/screens/critrea_period_detail_screen.dart';
import 'package:stock_scan_parser/screens/stock_parser_detail_screen.dart';
import 'package:stock_scan_parser/screens/stock_parser_list_screen.dart';

class RouteNames {
  static const String stockLParserList = '/';
  static const String stockLParserDetail = '/stockLParserDetail';
  static const String criteriaVariableDetail = '/criteriaVariableDetail';
  static const String criteriaVariablePeriodDetail =
      '/criteriaVariablePeriodDetail';
}

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteNames.stockLParserList:
      return MaterialPageRoute(
        builder: (context) => const StockParserListScreen(),
        settings: routeSettings,
      );
    case RouteNames.stockLParserDetail:
      return MaterialPageRoute(
        builder: (context) => const StockParserDetailScreen(),
        settings: routeSettings,
      );
    case RouteNames.criteriaVariableDetail:
      return MaterialPageRoute(
        builder: (context) => const CriteriaVariableDetailScreen(),
        settings: routeSettings,
      );
    case RouteNames.criteriaVariablePeriodDetail:
      return MaterialPageRoute(
        builder: (context) => const CriteriaPeriodDetailScreen(),
        settings: routeSettings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("Screen Does't exist "),
          ),
        ),
        settings: routeSettings,
      );
  }
}
