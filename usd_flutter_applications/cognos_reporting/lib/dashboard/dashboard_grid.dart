import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/dashboard_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/dashboard_tile.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report_model.dart';

class DashboardGrid extends StatefulWidget {
  @override
  _DashboardGridState createState() => _DashboardGridState();
}

class _DashboardGridState extends State<DashboardGrid> {
  DashboardBloc _dashboardBloc;

  @override
  void initState() {
    super.initState();
    _dashboardBloc = BlocProvider.of<DashboardBloc>(context)
      ..add(DashboardGetItems());
  }

  @override
  void dispose() {
    super.dispose();
    _dashboardBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: _dashboardBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case DashboardFetchingItems:
            return _loading();
          case DashboardItemsLoaded:
            return _grid(state);
          default:
            return _loading();
        }
      },
    );
  }

  Widget _grid(DashboardState state) {
    final _state = state as DashboardItemsLoaded;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return GridView.count(
          childAspectRatio: 1.3,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
          crossAxisCount: _getCrossAxisCount(sizingInformation),
          children: _state.items.map(_mapTiles).toList(),
        );
      },
    );
  }

  Widget _mapTiles(ReportModel report) => DashboardTile(report: report);

  Widget _loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator()],
      ),
    );
  }

  int _getCrossAxisCount(SizingInformation info) {
    switch (info.deviceScreenType) {
      case DeviceScreenType.Desktop:
        return 3;
      case DeviceScreenType.Tablet:
        return 2;
      default:
        return 1;
    }
  }
}
