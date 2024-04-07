import 'package:flutter/material.dart';
import 'models.dart';

class CandidateDetailScreen extends StatelessWidget {
  final Candidate candidate;

  const CandidateDetailScreen({required this.candidate, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Details'),
      ),
      body: Column(
        children: [
          Image.asset(candidate.imageUrl),
          Text(candidate.name),
          Text(candidate.position),
          ElevatedButton(
            onPressed: () {
              // Handle connect action
            },
            child: Text('Connect'),
          ),
        ],
      ),
    );
  }
}
