import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1467808840556012~5572227084";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1467808840556012~5572227084";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1467808840556012/7346868403";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1467808840556012/7346868403";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}