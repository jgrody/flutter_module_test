class CourseIDModel {
  final int id;
  final String name;

  CourseIDModel({
    this.id,
    this.name,
  });

  factory CourseIDModel.fromJson(Map<String, Object> period) {
    return CourseIDModel(
      id: period['id'],
      name: period['name'],
    );
  }
}