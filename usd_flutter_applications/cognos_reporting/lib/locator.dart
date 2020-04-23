import 'package:get_it/get_it.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/services/navigator.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigatorService());
}