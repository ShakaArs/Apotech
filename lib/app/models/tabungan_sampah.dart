class TrashDataResponse {
  final bool success;
  final String message;
  final List<TrashData> data;

  TrashDataResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TrashDataResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<TrashData> trashDataList =
        data.map((item) => TrashData.fromJson(item)).toList();

    return TrashDataResponse(
      success: json['success'],
      message: json['message'],
      data: trashDataList,
    );
  }
}

class TrashData {
  final int id;
  final int userId;
  final String status;
  final int trashBankId;
  final int userBalance;
  final int adminBalance;
  final String storeDate;
  final String createdAt;
  final String updatedAt;
  final TrashCategory trashCategory;
  final Iot iot;

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
      trashCategory: TrashCategory.fromJson(json['trash_category']),
      iot: Iot.fromJson(json['iot']),
    );
  }
}

class TrashCategory {
  final int id;
  final String categoryName;
  final int price;

  TrashCategory({
    required this.id,
    required this.categoryName,
    required this.price,
  });

  factory TrashCategory.fromJson(Map<String, dynamic> json) {
    return TrashCategory(
      id: json['id'],
      categoryName: json['category_name'],
      price: json['price'],
    );
  }
}

class Iot {
  final int id;
  final String code;
  final double weight;

  Iot({
    required this.id,
    required this.code,
    required this.weight,
  });

  factory Iot.fromJson(Map<String, dynamic> json) {
    return Iot(
      id: json['id'],
      code: json['code'],
      weight: json['weight'],
    );
  }
}
