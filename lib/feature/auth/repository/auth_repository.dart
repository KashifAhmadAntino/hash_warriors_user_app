import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:user_voting_app/core/routes/api_routes.dart';
import 'package:user_voting_app/feature/auth/models/login_response.dart';
import 'package:user_voting_app/feature/voting/models/candidate.dart';

class AuthRepository {
  final Dio _client;

  AuthRepository(this._client);

  Future<LoginResponse?> sendOtp(String voterId) async {
    try {
      final response = await _client
          .get(ApiUrl.sendOtp, queryParameters: {"voterId": voterId});

      return LoginResponse.fromMap(response.data);
    } on DioException catch (e) {
      return LoginResponse(errorString: e.response?.data["message"]);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> verifyOtp({
    final String? userId,
    final int? otp,
  }) async {
    try {
      final res = await _client
          .post(ApiUrl.verifyOtp, data: {"userId": userId, "otp": otp});
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
