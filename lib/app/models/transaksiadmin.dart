class TransactionadminResponse {
  final bool success;
  final String message;
  final TransactionadminData data;

  TransactionadminResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TransactionadminResponse.fromJson(Map<String, dynamic> json) {
    return TransactionadminResponse(
      success: json['success'],
      message: json['message'],
      data: TransactionadminData.fromJson(json['data']),
    );
  }
}

class TransactionadminData {
  final int totalIncome;
  final int userIncome;
  final int adminIncome;

  final List<TransactionadminItem> transactionadminList;

  TransactionadminData({
    required this.totalIncome,
    required this.userIncome,
    required this.adminIncome,
    required this.transactionadminList,
  });

  factory TransactionadminData.fromJson(Map<String, dynamic> json) {
    return TransactionadminData(
      totalIncome: json['total_income'],
      userIncome: json['user_income'],
      adminIncome: json['admin_income'],
      transactionadminList: (json['transaction_list'] as List)
          .map((item) => TransactionadminItem.fromJson(item))
          .toList(),
    );
  }
}

class TransactionadminItem {
  final int? id;
  final String? code;
  final int? userId;
  final int? trashBankId;
  final int? amount;
  final String? createdAt;
  final int? day;
  final int? month;
  final int? year;
  final String? updatedAt;
  final String? weight;

  TransactionadminItem({
    required this.id,
    required this.code,
    required this.userId,
    required this.trashBankId,
    required this.amount,
    required this.weight,
    required this.createdAt,
    required this.day,
    required this.month,
    required this.year,
    required this.updatedAt,
  });

  factory TransactionadminItem.fromJson(Map<String, dynamic> json) {
    final createdAtParts = json['created_at'].split('T')[0].split('-');

    return TransactionadminItem(
      id: json['id'],
      code: json['code'],
      userId: json['user_id'],
      trashBankId: json['trash_bank_id'],
      amount: json['amount'],
      weight: json['weight'],
      createdAt: json['created_at'],
      day: int.parse(createdAtParts[2]),
      month: int.parse(createdAtParts[1]),
      year: int.parse(createdAtParts[0]),
      updatedAt: json['updated_at'],
    );
  }
}
