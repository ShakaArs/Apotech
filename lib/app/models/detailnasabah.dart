class DetailDataNasabah {
  final int id;
  final String fullName;
  final String profilePicture;
  final String address;
  final String noKK;
  final String phone;

  DetailDataNasabah({
    required this.id,
    required this.fullName,
    required this.profilePicture,
    required this.address,
    required this.noKK,
    required this.phone,
  });

  factory DetailDataNasabah.fromJson(Map<String, dynamic> json) {
    return DetailDataNasabah(
      id: json['id'],
      fullName: json['full_name'],
      profilePicture: json['profile_picture'],
      address: json['address'],
      noKK: json['no_kk'],
      phone: json['phone'],
    );
  }
}

class ListDetailDatanasabah {
  static int? id;
  static String? full_name;
  static String? role;
  static String? phone;
  static String? address;
  static String? location;
  static String? no_kk;
}
