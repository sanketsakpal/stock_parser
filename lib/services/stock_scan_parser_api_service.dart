import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stock_scan_parser/models/stock_parser_data_model.dart';
import 'package:stock_scan_parser/services/error_handler.dart';
import 'package:stock_scan_parser/utils/api_end_point.dart';

class StockScanParserApiServices {
  final Dio dio = Dio();
  List<StockParserDataModel> stockList = [];
  Future<List<StockParserDataModel>> fetchStockData() async {
    try {
      final response = await dio.get(ApiEndPoints.stockParserApi);
      final responseData = jsonDecode(jsonEncode(response.data)) as List;
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(responseData);
        }
        return responseData
            .map(
              (e) => StockParserDataModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw errorHandler(response as DioException);
      }
    } on DioException {
      rethrow;
    }
  }
}
