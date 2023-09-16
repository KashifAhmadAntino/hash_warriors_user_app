// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Candidate {
  final String name;
  final String partyName;
  final String imageUrl;
  Candidate({
    required this.name,
    required this.partyName,
    required this.imageUrl,
  });

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      name: map['name'] as String,
      partyName: map['partyName'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory Candidate.fromJson(String source) =>
      Candidate.fromMap(json.decode(source) as Map<String, dynamic>);
}
