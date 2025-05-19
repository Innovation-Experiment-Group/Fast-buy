 class Commodity {
  final String id;          // 商品唯一标识
  final String name;        // 商品名称
  final String description; // 商品描述
  final double price;       // 商品价格
  final String imageUrl;    // 商品图片URL
  final Map<String, dynamic> attributes; // 商品属性
  final int stock;          // 库存数量
  final String category;    // 商品类别
  final DateTime createdAt; // 创建时间
  final DateTime updatedAt; // 更新时间

  Commodity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.attributes,
    required this.stock,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Commodity.fromJson(Map<String, dynamic> json) {
    return Commodity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      attributes: json['attributes'],
      stock: json['stock'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'attributes': attributes,
      'stock': stock,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}