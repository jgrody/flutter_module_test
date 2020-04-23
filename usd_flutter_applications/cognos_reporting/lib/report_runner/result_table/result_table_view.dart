import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:usd_flutter_modules/ui/app_bar/app_bar.dart';

class ReportRunnerResultTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(),
          ),
        );
      },
    );
  }
}
