class IoT {
  final int id;
  final String code;
  final double weight;

  IoT({
    required this.id,
    required this.code,
    required this.weight,
  });

  factory IoT.fromJson(Map<String, dynamic> json) {
    return IoT(
      id: json['id'],
      code: json['code'],
      weight: json['weight'].toDouble(),
    );
  }
}

class TrashData {
  final int id;
  final int userId;
  final String status;
  final int trashBankId;
  final int? userBalance;
  final int? adminBalance;
  final String storeDate;
  final String createdAt;
  final String updatedAt;
  final String trashCategory;
  final IoT? iot;

  TrashData({
    required this.id,
    required this.userId,
    required this.status,
    required this.trashBankId,
    required this.userBalance,
    required this.adminBalance,
    required this.storeDate,
    required this.createdAt,
    required this.updatedAt,
    required this.trashCategory,
    required this.iot,
  });

  factory TrashData.fromJson(Map<String, dynamic> json) {
    return TrashData(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      trashBankId: json['trash_bank_id'],
      userBalance: json['user_balance'],
      adminBalance: json['admin_balance'],
      storeDate: json['store_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      trashCategory: json['trash_category'],
      iot: json['iot'] != null ? IoT.fromJson(json['iot']) : null,
    );
  }
}

class TrashModel {
  final bool success;
  final String message;
  final List<TrashData> data;

  TrashModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TrashModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<TrashData> trashDataList =
        dataList.map((item) => TrashData.fromJson(item)).toList();

    return TrashModel(
      success: json['success'],
      message: json['message'],
      data: trashDataList,
    );
  }
}
