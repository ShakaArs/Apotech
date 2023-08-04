class ApiResponse {
  bool success;
  String message;
  String token;
  TransaksiAdmin data;
  String total_income;
  String user_income;
  String admin_income;

  ApiResponse(
      {required this.success,
      required this.message,
      required this.token,
      required this.data,
      required this.total_income,
      required this.user_income,
      required this.admin_income});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      total_income: json['total_income'],
      user_income: json['user_income'],
      admin_income: json['admin_income'],
      data: TransaksiAdmin.fromJson(
        json['data'],
      ),
    );
  }
}

class TransaksiAdmin {
  int id;
  String code;
  String trash_bank_id;
  String amount;
  String weight;
  TransaksiAdmin({
    required this.id,
    required this.code,
    required this.trash_bank_id,
    required this.amount,
    required this.weight,
  });

  factory TransaksiAdmin.fromJson(Map<String, dynamic> json) {
    return TransaksiAdmin(
      id: json['id'],
      code: json['code'],
      trash_bank_id: json['trash_bank_id'],
      amount: json['amount'],
      weight: json['weight'],
    );
  }
}

class TRANSAKSIADMIN {
  static int? id;
  static String? code;
  static String? trash_bank_id;
  static String? amount;
  static String? weight;
}
