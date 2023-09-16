import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class UserLocation {
  Placemark? userLocation;
  RxBool userAuthorisedToVote = true.obs;

  static final UserLocation _singleton = UserLocation._internal();

  factory UserLocation() {
    return _singleton;
  }

  UserLocation._internal();
}
