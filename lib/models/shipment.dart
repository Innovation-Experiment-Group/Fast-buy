 class Shipment {
  final String trackingNumber;    // 单号
  final String clientCode;        // 客户代码
  final String transportMethod;   // 运输方式
  final int estimatedDays;        // 预计运输时间
  final String status;            // 运单状态
  final DateTime createdAt;       // 创建时间
  final DateTime? departureDate;  // 发出日期
  final DateTime? arrivalDate;    // 到达时间
  final DateTime? pickupDate;     // 提货时间
  final String cargoCode;         // 货物简称
  final String cargoDetails;      // 货物明细
  final int packageCount;         // 包裹数量
  final int portTimezone;         // 发货港口时区

  Shipment({
    required this.trackingNumber,
    required this.clientCode,
    required this.transportMethod,
    required this.estimatedDays,
    required this.status,
    required this.createdAt,
    this.departureDate,
    this.arrivalDate,
    this.pickupDate,
    required this.cargoCode,
    required this.cargoDetails,
    required this.packageCount,
    required this.portTimezone,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      trackingNumber: json['trackingNumber'],
      clientCode: json['clientCode'],
      transportMethod: json['transportMethod'],
      estimatedDays: json['estimatedDays'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      departureDate: json['departureDate'] != null ? DateTime.parse(json['departureDate']) : null,
      arrivalDate: json['arrivalDate'] != null ? DateTime.parse(json['arrivalDate']) : null,
      pickupDate: json['pickupDate'] != null ? DateTime.parse(json['pickupDate']) : null,
      cargoCode: json['cargoCode'],
      cargoDetails: json['cargoDetails'],
      packageCount: json['packageCount'],
      portTimezone: json['portTimezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trackingNumber': trackingNumber,
      'clientCode': clientCode,
      'transportMethod': transportMethod,
      'estimatedDays': estimatedDays,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'departureDate': departureDate?.toIso8601String(),
      'arrivalDate': arrivalDate?.toIso8601String(),
      'pickupDate': pickupDate?.toIso8601String(),
      'cargoCode': cargoCode,
      'cargoDetails': cargoDetails,
      'packageCount': packageCount,
      'portTimezone': portTimezone,
    };
  }
}