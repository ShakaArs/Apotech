class NameModel {
  final int id;
  final String name;
  final String description;

  NameModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}