import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/locator.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/reports/report_model.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/routing/routes.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/services/navigator.dart';
import 'package:usd_flutter_modules/modules/cognos_reporting/lib/theme.dart';
import 'package:usd_flutter_modules/ui/list_tile/list_tile.dart';

class DashboardTile extends StatelessWidget {
  final ReportModel report;

  const DashboardTile({Key key, this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return GestureDetector(
          onTap: () => locator<NavigatorService>().navigateTo(
            Routes.reportRunner,
            queryParams: {'id': report.idString},
          ),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTileTheme(
                      iconColor: usdBlue,
                      child: USDListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: AutoSizeText(
                          report.title,
                          style: Theme.of(context).textTheme.headline6,
                          maxLines: 4,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            report.description,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        trailing: Icon(
                          Icons.table_chart,
                          size: sizingInformation.localWidgetSize.height * .25,
                        ),
                      ),
                    ),
                    ButtonBar(
                      buttonPadding: EdgeInsets.all(0),
                      alignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(report.createdAtFormatted),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
