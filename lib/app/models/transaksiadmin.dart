class TransaksiAdmin {
  final String full_name;
  final int id;
  final String code;
  final String trash_bank_id;
  final String amount;
  final String created_at;
  final String updated_at;
  final String weight;
  final String total_income;
  final String user_income;
  final String admin_income;

  TransaksiAdmin({
    required this.full_name,
    required this.id,
    required this.code,
    required this.trash_bank_id,
    required this.amount,
    required this.created_at,
    required this.updated_at,
    required this.weight,
    required this.total_income,
    required this.user_income,
    required this.admin_income,
  });

  factory TransaksiAdmin.fromJson(Map<String, dynamic> json) {
    return TransaksiAdmin(
      full_name: json['full_name'] as String? ?? '', // Default value if null
      id: json['id'] as int? ?? 0, // Default value if null
      code: json['code'] as String? ?? '', // Default value if null
      trash_bank_id:
          json['trash_bank_id'] as String? ?? '', // Default value if null
      amount: json['amount'] as String? ?? '', // Default value if null
      created_at: json['created_at'] as String? ?? '', // Default value if null
      updated_at: json['updated_at'] as String? ?? '',
      weight: json['weight'] as String? ?? '',
      total_income: json['total__income'] as String? ?? '',
      user_income: json['user__income'] as String? ?? '',
      admin_income: json['admin__income'] as String? ?? '',
    );
  }
}

class ListDetailDatanasabah {
  static String? full_name;
  static int? id;
  static String? code;
  static String? trash_bank_id;
  static String? amount;
  static String? created_at;
  static String? updateat;
  static String? weight;
  static String? total_income;
  static String? user_income;
  static String? admin_income;
}
