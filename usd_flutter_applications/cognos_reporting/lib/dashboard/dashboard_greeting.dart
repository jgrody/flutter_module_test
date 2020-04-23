import 'package:flutter/material.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/dashboard/constants.dart';
import 'package:usd_flutter_modules/ui/list_tile/list_tile.dart';

class DashboardGreetingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return USDListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(dashboardPageTitle),
      subtitle: Text(dashboardPageSubtitle),
    );
  }
}
