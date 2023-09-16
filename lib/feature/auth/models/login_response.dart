import 'dart:convert';

class LoginResponse {
  final int? otp;
  final String? userId;
  final String? errorString;
  LoginResponse({
    this.otp,
    this.userId,
    this.errorString,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      otp: map['data']['otp'] != null ? map['data']['otp'] as int? : null,
      userId: map['data']['userId'] != null
          ? map['data']['userId'] as String?
          : null,
    );
  }

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
