import 'package:shared_preferences/shared_preferences.dart';

class VipService {
  static const String _keyIsVipActive = 'vip_is_active';
  static const String _keyVipProductId = 'vip_product_id';
  static const String _keyVipPurchaseDate = 'vip_purchase_date';
  static const String _keyVipDurationDays = 'vip_duration_days';
  static const String _keyVipExpiryDate = 'vip_expiry_date';

  static Future<bool> isVipActive() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isActive = prefs.getBool(_keyIsVipActive) ?? false;
      final expiryDate = prefs.getString(_keyVipExpiryDate);
      
      if (isActive && expiryDate != null) {
        final expiry = DateTime.parse(expiryDate);
        if (DateTime.now().isAfter(expiry)) {
          await deactivateVip();
          return false;
        }
      }
      
      return isActive;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> isVipExpired() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final expiryDate = prefs.getString(_keyVipExpiryDate);
      
      if (expiryDate == null) {
        return true;
      }
      
      final expiry = DateTime.parse(expiryDate);
      return DateTime.now().isAfter(expiry);
    } catch (e) {
      return true;
    }
  }

  static Future<int> getVipRemainingDays() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final expiryDate = prefs.getString(_keyVipExpiryDate);
      
      if (expiryDate == null) {
        return 0;
      }
      
      final expiry = DateTime.parse(expiryDate);
      final now = DateTime.now();
      
      if (now.isAfter(expiry)) {
        return 0;
      }
      
      final difference = expiry.difference(now);
      return difference.inDays;
    } catch (e) {
      return 0;
    }
  }

  static Future<String?> getVipPurchaseDate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyVipPurchaseDate);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getVipProductId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyVipProductId);
    } catch (e) {
      return null;
    }
  }

  static Future<void> activateVip({
    required String productId,
    required String purchaseDate,
    required int durationDays,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final purchaseDateTime = DateTime.parse(purchaseDate);
      final expiryDate = purchaseDateTime.add(Duration(days: durationDays));
      
      await prefs.setBool(_keyIsVipActive, true);
      await prefs.setString(_keyVipProductId, productId);
      await prefs.setString(_keyVipPurchaseDate, purchaseDate);
      await prefs.setInt(_keyVipDurationDays, durationDays);
      await prefs.setString(_keyVipExpiryDate, expiryDate.toIso8601String());
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deactivateVip() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyIsVipActive, false);
      await prefs.remove(_keyVipProductId);
      await prefs.remove(_keyVipPurchaseDate);
      await prefs.remove(_keyVipDurationDays);
      await prefs.remove(_keyVipExpiryDate);
    } catch (e) {
      // Ignore errors
    }
  }
}


