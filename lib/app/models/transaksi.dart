class ApiResponse {
  bool success;
  String message;
  TransaksiData data;

  ApiResponse(
      {required this.success, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: TransaksiData.fromJson(json['data']),
    );
  }
}

class TransaksiData {
  int userBalance;
  List<TransactionItem> transactionList;

  TransaksiData({
    required this.userBalance,
    required this.transactionList,
  });

  factory TransaksiData.fromJson(Map<String, dynamic> json) {
    return TransaksiData(
      userBalance: json['user_balance'],
      transactionList: List<TransactionItem>.from(
          json['transaction_list'].map((x) => TransactionItem.fromJson(x))),
    );
  }
}

class TransactionItem {
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

  TransactionItem({
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

  factory TransactionItem.fromJson(Map<String, dynamic> json) {
    return TransactionItem(
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

class TransactionItemList {
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
