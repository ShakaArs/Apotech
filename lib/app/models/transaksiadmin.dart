class ApiResponse {
  bool success;
  String message;
  TransaksiAdminData data;

  ApiResponse(
      {required this.success, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: TransaksiAdminData.fromJson(json['data']),
    );
  }
}

class TransaksiAdminData {
  int id;
  String code;
  String trash_bank_id;
  int amount;
  String created_at;
  String updated_at;
  String weight;
  int total_income;
  int user_income;
  int admin_income;

  TransaksiAdminData({
    required this.id,
    required this.code,
    required this.amount,
    required this.trash_bank_id,
    required this.created_at,
    required this.updated_at,
    required this.weight,
    required this.total_income,
    required this.user_income,
    required this.admin_income,
  });

  factory TransaksiAdminData.fromJson(Map<String, dynamic> json) {
    return TransaksiAdminData(
      id: json['id'],
      code: json['code'],
      amount: json['amount'],
      trash_bank_id: json['trash_bank_id'],
      created_at: json['created_at'],
      weight: json['weight'],
      updated_at: json['updated_at'],
      total_income: json['total_income'],
      user_income: json['user_income'],
      admin_income: json['admin_income'],
    );
  }
}

class TransaksiAdminList {
  static int? id;
  static String? code;
  static int? amount;
  static String? trash_bank_id;
  static String? created_at;
  static String? updated_at;
  static String? weight;
  static int? total_income;
  static int? user_income;
  static int? admin_income;
}
