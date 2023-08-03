class DataNasabah {
  final int id;
  final String fullName;
  final String phone;

  DataNasabah({
    required this.id,
    required this.fullName,
    required this.phone,
  });

  factory DataNasabah.fromJson(Map<String, dynamic> json) {
    return DataNasabah(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone': phone,
    };
  }
}
