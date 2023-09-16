// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Candidate {
  final String name;
  final String voterId;
  final String partyName;
  final String imageUrl;
  Candidate({
    required this.name,
    required this.partyName,
    required this.voterId,
    required this.imageUrl,
  });

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      name: map['candidate'] != null ? map['candidate']['name'] as String : "",
      partyName: map['name'] as String,
      imageUrl: map['symbol'] as String,
      voterId: map['voterId'] as String,
    );
  }

  factory Candidate.fromJson(String source) =>
      Candidate.fromMap(json.decode(source) as Map<String, dynamic>);
}
