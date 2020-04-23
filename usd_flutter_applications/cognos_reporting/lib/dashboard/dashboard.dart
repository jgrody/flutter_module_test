import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/constants.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/dashboard_bloc.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/dashboard_greeting.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/dashboard_grid.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/locator.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/reports_repository.dart';
import 'package:usd_flutter_modules/native_integration/channel.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    locator<RoutingChannel>().updateNativeAppTitle(dashboardPageTitleMobile);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(
        reportsRepository: RepositoryProvider.of<ReportsRepository>(context),
      ),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              child: SafeArea(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    DashboardGreetingView(),
                    SizedBox(height: 40),
                    DashboardGrid(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
