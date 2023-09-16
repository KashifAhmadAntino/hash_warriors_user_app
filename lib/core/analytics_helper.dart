import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:user_voting_app/core/user_location.dart';

class AnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void logEvent(String eventName, Map<String, dynamic>? params) async {
    Map<String, dynamic>? temp = {};
    //

    params?.forEach((key, value) {
      temp[key] = value.toString();
    });
    params?.addAll({
      "postalCode": UserLocation().userLocation?.postalCode?.toString() ?? '',
      "city": UserLocation().userLocation?.administrativeArea.toString() ?? '',
      "area": UserLocation().userLocation?.name ?? '',
      "locality": UserLocation().userLocation?.locality ?? ''
    });
    try {
      await analytics.logEvent(name: eventName, parameters: params);
    } catch (e) {
      print(e);
    }
  }
}
