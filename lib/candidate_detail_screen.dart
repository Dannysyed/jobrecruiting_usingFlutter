import 'package:flutter/material.dart';
import 'models.dart';

class CandidateDetailScreen extends StatelessWidget {
  final Candidate candidate;

  const CandidateDetailScreen({required this.candidate, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Details'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: AssetImage(candidate.imageUrl),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text(
            candidate.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            candidate.position,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Short bio about the candidate. This can be a brief summary of their experience, skills, and interests.',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle connect action
              print('Connected with ${candidate.name}');
            },
            child: const Text('Connect'),
          ),
        ],
      ),
    );
  }
}
