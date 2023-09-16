import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:user_voting_app/core/user_location.dart';

class AnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void logEvent(String eventName, Map<String, dynamic>? params) async {
    params?.addAll({
      "postalCode": UserLocation().userLocation?.postalCode,
      "city": UserLocation().userLocation?.administrativeArea,
      "area": UserLocation().userLocation?.name,
      "locality": UserLocation().userLocation?.locality
    });
    await analytics.logEvent(name: '', parameters: params);
  }
}
