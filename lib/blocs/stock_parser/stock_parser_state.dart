// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stock_parser_bloc.dart';

enum StockParserStatus { initial, loading, success, error }

class StockParserState extends Equatable {
  final StockParserStatus status;
  final List<StockParserDataModel> stockParserData;
  const StockParserState({
    required this.status,
    required this.stockParserData,
  });

  factory StockParserState.initial() {
    return const StockParserState(
      status: StockParserStatus.initial,
      stockParserData: [],
    );
  }

  StockParserState copyWith({
    StockParserStatus? status,
    List<StockParserDataModel>? stockParserData,
  }) {
    return StockParserState(
      status: status ?? this.status,
      stockParserData: stockParserData ?? this.stockParserData,
    );
  }

  @override
  String toString() =>
      'StockParserState(status: $status, stockParserData: $stockParserData)';

  @override
  List<Object?> get props => [status, stockParserData];
}
