// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Candidate {
  final String? name;
  final String? partyName;
  final String? imageUrl;
  final String? partyId;
  final String? candidateId;
  Candidate({
    required this.name,
    required this.partyName,
    required this.partyId,
    required this.imageUrl,
    required this.candidateId,
  });

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      name: map['candidate'] != null ? map['candidate']['name'] as String? : "",
      partyName: map['name'] as String?,
      imageUrl: map['symbol'] as String?,
      partyId: map['_id'] as String?,
      candidateId:
          map['candidate'] != null ? map['candidate']['_id'] as String? : "",
    );
  }

  factory Candidate.fromJson(String source) =>
      Candidate.fromMap(json.decode(source) as Map<String, dynamic>);
}
