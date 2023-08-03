
import 'dart:convert';

class UserData {
  int userId;
  int otpCode;

  UserData({required this.userId, required this.otpCode});

  // Factory method untuk membuat objek UserData dari JSON
  factory UserData.fromJson(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return UserData(
      userId: data['user_id'],
      otpCode: data['otp_code'],
    );
  }

  // Method untuk mengubah objek UserData menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'otp_code': otpCode,
    };
  }
}