import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:user_voting_app/core/routes/api_routes.dart';
import 'package:user_voting_app/feature/voting/models/candidate.dart';

class VotingRepository {
  final Dio _client;

  VotingRepository(this._client);

  Future<List<Candidate>?> getAllCandidates() async {
    try {
      final response = await _client.get(ApiUrl.getCandidates);
      final List list = response.data;
      final List<Candidate> candidates =
          list.map((e) => Candidate.fromMap(e)).toList();
      return candidates;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> submitVote(Candidate candidate) async {
    try {
      await _client.post(ApiUrl.vote);
    } catch (e) {
      log(e.toString());
    }
  }
}
