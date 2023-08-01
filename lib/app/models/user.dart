class Login {
  final bool success;
  final String message;
  final String token;
  final UserData data;

  Login({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "token": token,
      "data": data.toJson(),
    };
  }
}

class UserData {
  final int id;
  final String fullName;
  final String phone;
  final String address;
  final String noKK;

  UserData({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.noKK,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      noKK: json['no_kk'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone': phone,
      'address': address,
      'no_kk': noKK,
    };
  }
}
