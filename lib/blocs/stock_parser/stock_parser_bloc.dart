import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/models/stock_parser_data_model.dart';
import 'package:stock_scan_parser/repositories/stock_parser_repository.dart';

part 'stock_parser_event.dart';
part 'stock_parser_state.dart';

class StockParserBloc extends Bloc<StockParserEvent, StockParserState> {
  StockParserBloc() : super(StockParserState.initial()) {
    on<FetchStockParserData>(_onFetchStockParserData);
  }

  Future<void> _onFetchStockParserData(
    FetchStockParserData event,
    Emitter<StockParserState> emit,
  ) async {
    emit(state.copyWith(status: StockParserStatus.loading));
    try {
      final StockParserRepository stockParserRepository =
          StockParserRepository();

      final data = await stockParserRepository.stockParserApi();

      emit(
        state.copyWith(
          status: StockParserStatus.success,
          stockParserData: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: StockParserStatus.error));
    }
  }
}
