import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/blocs/stock_parser/stock_parser_bloc.dart';
import 'package:stock_scan_parser/resources/color_manager.dart';
import 'package:stock_scan_parser/resources/font_manager.dart';
import 'package:stock_scan_parser/resources/routes_manager.dart';
import 'package:stock_scan_parser/resources/value_manager.dart';
import 'package:stock_scan_parser/widgets/back_ground_container.dart';

class StockParserListScreen extends StatelessWidget {
  const StockParserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockParserBloc, StockParserState>(
      listener: (context, state) {
        if (state.status == StockParserStatus.error) {
          const Material(
            child: Center(
              child: Text("Something Went Wrong"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == StockParserStatus.loading) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else {
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
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                      child: const Divider(
                        color: ColorManager.whiteColor,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: state.stockParserData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteNames.stockLParserDetail,
                          arguments: state.stockParserData[index],
                        );
                      },
                      title: Text(
                        state.stockParserData[index].name ?? "",
                        style: TextStyle(
                          color: ColorManager.whiteColor,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      subtitle: Text(
                        state.stockParserData[index].tag ?? "",
                        style: TextStyle(
                          color:
                              state.stockParserData[index].tag == "Bullish" ||
                                      state.stockParserData[index].tag ==
                                          "Intraday Bullish"
                                  ? ColorManager.greenColor
                                  : ColorManager.redColor,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
