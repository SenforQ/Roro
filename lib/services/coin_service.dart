import 'package:shared_preferences/shared_preferences.dart';

class CoinService {
  static const String _keyCurrentCoins = 'current_coins';
  static const String _keyIsInitialized = 'coins_initialized';

  static Future<void> initializeNewUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isInitialized = prefs.getBool(_keyIsInitialized) ?? false;
      
      if (!isInitialized) {
        await prefs.setInt(_keyCurrentCoins, 0);
        await prefs.setBool(_keyIsInitialized, true);
      }
    } catch (e) {
      // Ignore errors
    }
  }

  static Future<int> getCurrentCoins() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_keyCurrentCoins) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  static Future<bool> addCoins(int coins) async {
    try {
      if (coins <= 0) {
        return false;
      }
      
      final prefs = await SharedPreferences.getInstance();
      final currentCoins = prefs.getInt(_keyCurrentCoins) ?? 0;
      final newCoins = currentCoins + coins;
      
      await prefs.setInt(_keyCurrentCoins, newCoins);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deductCoins(int coins) async {
    try {
      if (coins <= 0) {
        return false;
      }
      
      final prefs = await SharedPreferences.getInstance();
      final currentCoins = prefs.getInt(_keyCurrentCoins) ?? 0;
      
      if (currentCoins < coins) {
        return false;
      }
      
      final newCoins = currentCoins - coins;
      await prefs.setInt(_keyCurrentCoins, newCoins);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> hasEnoughCoins(int coins) async {
    try {
      final currentCoins = await getCurrentCoins();
      return currentCoins >= coins;
    } catch (e) {
      return false;
    }
  }
}


