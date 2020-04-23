import 'package:usd_flutter_modules/modules/cognos_reporting/lib/routing/routing_data.dart';

extension StringExtensions on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
      queryParams: uriData.queryParameters,
      route: uriData.path
    );
  }
}