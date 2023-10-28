import 'package:stock_scan_parser/models/stock_parser_data_model.dart';
import 'package:stock_scan_parser/services/stock_scan_parser_api_service.dart';

class StockParserRepository {
  final StockScanParserApiServices scanParserApiServices =
      StockScanParserApiServices();

  Future<List<StockParserDataModel>> stockParserApi() async {
    try {
      final stockParserDataModel = await scanParserApiServices.fetchStockData();
      return stockParserDataModel;
    } catch (e) {
      rethrow;
    }
  }
}
