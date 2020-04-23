import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider<DashboardBloc>(
    //   create: (context) => DashboardBloc(reportsRepository: RepositoryProvider.of<ReportsRepository>(context)),
    //   child:
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // DashboardGreetingView(),
                // SizedBox(height: 40),
                // DashboardGrid(),
              ],
            ),
          ),
        );
      },
    );
    // );
  }
}
