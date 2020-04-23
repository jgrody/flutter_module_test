class AcademicPeriodModel {
  final int id;
  final String term;

  AcademicPeriodModel({
    this.id,
    this.term,
  });

  factory AcademicPeriodModel.fromJson(Map<String, Object> period) {
    return AcademicPeriodModel(
      id: period['id'],
      term: period['term'],
    );
  }

}