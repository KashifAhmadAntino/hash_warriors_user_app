import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:user_voting_app/core/analytics_helper.dart';
import 'package:user_voting_app/core/routes/api_routes.dart';
import 'package:user_voting_app/feature/voting/models/candidate.dart';

class VotingRepository {
  final Dio _client;

  VotingRepository(this._client);

  Future<List<Candidate>?> getAllCandidates() async {
    try {
      final response = await _client.get(ApiUrl.getCandidates);
      final List list = response.data['data'];
      final List<Candidate> candidates =
          list.map((e) => Candidate.fromMap(e)).toList();
      AnalyticsHelper().logEvent('fetched_all_candidate', {});
      return candidates;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> submitVote(
      Candidate candidate, String userId, String otp) async {
    try {
      final body = {
        "userId": userId,
        "otp": otp,
        "candidateId": candidate.candidateId,
        "partyId": candidate.partyId
      };
      final response = await _client.post(ApiUrl.vote, data: body);
      AnalyticsHelper().logEvent('user_voted', {
        'user_voted': true,
        "userId": userId,
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
