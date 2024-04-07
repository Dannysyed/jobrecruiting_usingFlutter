import 'package:flutter/material.dart';
import 'models.dart';

class CandidatesScreen extends StatelessWidget {
  CandidatesScreen({super.key});

  final List<Candidate> allCandidates = [
    Candidate(
        name: 'John Doe',
        position: 'Software Developer',
        imageUrl: 'assets/images/john_doe.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: allCandidates.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(allCandidates[index].imageUrl),
              title: Text(allCandidates[index].name),
              subtitle: Text(allCandidates[index].position),
              onTap: () {
                // Navigating to Candidate Detail Screen
              },
            ),
          );
        },
      ),
    );
  }
}
