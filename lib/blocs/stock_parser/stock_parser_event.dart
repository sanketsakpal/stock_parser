part of 'stock_parser_bloc.dart';

sealed class StockParserEvent extends Equatable {
  const StockParserEvent();

  @override
  List<Object> get props => [];
}

class FetchStockParserData extends StockParserEvent {
  const FetchStockParserData();
}
