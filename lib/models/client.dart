 class Client {
  final String code;        // 客户代码，唯一标识
  final String name;        // 客户姓名
  final String contact;     // 客户联系方式
  final String country;     // 客户国家
  final String language;    // 客户语言
  final int timezone;       // 客户时区（小时偏移量）

  Client({
    required this.code,
    required this.name,
    required this.contact,
    required this.country,
    required this.language,
    required this.timezone,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      code: json['code'],
      name: json['name'],
      contact: json['contact'],
      country: json['country'],
      language: json['language'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'contact': contact,
      'country': country,
      'language': language,
      'timezone': timezone,
    };
  }
}