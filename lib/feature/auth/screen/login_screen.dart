import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:user_voting_app/core/constants/app_text_style.dart';
import 'package:user_voting_app/core/image_loader.dart';
import 'package:user_voting_app/core/universal_widgets/custom_text_field_with_label.dart';
import 'package:user_voting_app/core/user_location.dart';

import '../../../core/reponsive/SizeConfig.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCurrentPosition();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: ImageLoader.asset('assets/login_svg.png')),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 55 * SizeConfig.heightMultiplier!,
                      ),
                      Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20 * SizeConfig.textMultiplier,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                      SizedBox(
                        height: 5 * SizeConfig.heightMultiplier,
                      ),
                      Text(
                        'Vote Karo, Desh Badlo!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF282828),
                          fontSize: 14 * SizeConfig.textMultiplier,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 20 * SizeConfig.heightMultiplier!,
                      ),
                      CustomTextFieldWithLabel(
                        controller: nameController,
                        title: 'Enter you Voter ID',
                        dynamicKeyboardText: 'GDN0453323',
                        hint: 'GDN0453323',
                      ),
                      SizedBox(
                        height: 16.heightMultiplier,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (UserLocation().userAuthorisedToVote.value ==
                              false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("You are not eligible to vote!")));
                          } else {
                            //todo call login api
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56 * SizeConfig.heightMultiplier!,
                          decoration: ShapeDecoration(
                            color: Color(0xFF128807),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'Verify',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16 * SizeConfig.textMultiplier,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * SizeConfig.heightMultiplier!,
                      ),
                      Obx(
                        () => UserLocation().userAuthorisedToVote.value != true
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'You are not eligible to vote!',
                                    style: AppTextStyle.f16w600InterErrorRed02,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      UserLocation().userAuthorisedToVote.value = false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      UserLocation().userAuthorisedToVote.value = false;
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        UserLocation().userAuthorisedToVote.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      UserLocation().userLocation = place;
      if (place.country?.toLowerCase() == 'india') {
        UserLocation().userAuthorisedToVote.value = true;
      } else {
        UserLocation().userAuthorisedToVote.value = false;
      }
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
