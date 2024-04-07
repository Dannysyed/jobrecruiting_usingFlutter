import 'package:flutter/material.dart';
import 'models.dart';

class CandidateDetailScreen extends StatelessWidget {
  final Candidate candidate;

  CandidateDetailScreen({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: AssetImage(candidate.imageUrl),
            radius: 50,
          ),
          SizedBox(height: 20),
          Text(
            candidate.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            candidate.position,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Short bio about the candidate. This can be a brief summary of their experience, skills, and interests.',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle connect action
              print('Connected with ${candidate.name}');
            },
            child: Text('Connect'),
          ),
        ],
      ),
    );
  }
}
