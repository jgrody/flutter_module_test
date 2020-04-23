import 'package:intl/intl.dart';

class ReportModel {
  final int id;
  final String type;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime modifiedAt;

  String get idString => id.toString();

  String get createdAtFormatted =>
    DateFormat('M/dd/yyyy h:mm a').format(createdAt);

  ReportModel({
    this.id,
    this.type,
    this.title,
    this.description,
    this.createdAt,
    this.modifiedAt,
  });

  factory ReportModel.fromJson(Map<String, Object> report) {
    return ReportModel(
      id: report['id'],
      type: report['type'],
      title: report['title'],
      description: report['description'],
      createdAt: report['createdAt'],
      modifiedAt: report['modifiedAt'],
    );
  }

}