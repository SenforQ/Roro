class VipSubscription {
  final String id;
  final String productId;
  final String subtitle;
  final double price;
  final bool isMostPopular;
  final bool isPriceLoaded;

  VipSubscription({
    required this.id,
    required this.productId,
    required this.subtitle,
    required this.price,
    this.isMostPopular = false,
    this.isPriceLoaded = false,
  });

  VipSubscription copyWith({
    String? id,
    String? productId,
    String? subtitle,
    double? price,
    bool? isMostPopular,
    bool? isPriceLoaded,
  }) {
    return VipSubscription(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      isMostPopular: isMostPopular ?? this.isMostPopular,
      isPriceLoaded: isPriceLoaded ?? this.isPriceLoaded,
    );
  }
}

class VipPrivilege {
  final String title;

  VipPrivilege({
    required this.title,
  });
}


