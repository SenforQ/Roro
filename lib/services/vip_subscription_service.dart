import '../models/vip_subscription.dart';

class VipSubscriptionService {
  static List<VipSubscription> getSubscriptions() {
    return [
      VipSubscription(
        id: 'weekly',
        productId: 'RoroWeekVIP',
        subtitle: 'Weekly VIP',
        price: 12.99,
        isMostPopular: false,
      ),
      VipSubscription(
        id: 'monthly',
        productId: 'RoroMonthVIP',
        subtitle: 'Monthly VIP',
        price: 49.99,
        isMostPopular: true,
      ),
    ];
  }

  static List<VipPrivilege> getPrivileges() {
    return [
      VipPrivilege(title: 'Unlimited access to all characters'),
      VipPrivilege(title: 'Ad-free experience'),
      VipPrivilege(title: 'Priority customer support'),
      VipPrivilege(title: 'Exclusive VIP content'),
      VipPrivilege(title: 'Enjoy 3 Guide Voice services per week for free'),
    ];
  }
}

