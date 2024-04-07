import 'package:flutter/material.dart';
import 'models.dart';

class CandidateDetailScreen extends StatefulWidget {
  final Candidate candidate;

  const CandidateDetailScreen({required this.candidate, super.key});

  @override
  State<CandidateDetailScreen> createState() => _CandidateDetailScreenState();
}

class _CandidateDetailScreenState extends State<CandidateDetailScreen> {
  bool _isConnected = false;

  void _connect() {
    setState(() {
      _isConnected = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Connected with ${widget.candidate.name}')),
    );
  }

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
            backgroundImage: AssetImage(widget.candidate.imageUrl),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text(
            widget.candidate.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.candidate.position,
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
            onPressed: _isConnected ? null : _connect,
            child: Text(_isConnected ? 'Connected' : 'Connect'),
          ),
        ],
      ),
    );
  }
}
