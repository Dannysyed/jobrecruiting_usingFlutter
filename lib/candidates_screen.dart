import 'package:flutter/material.dart';
import 'candidate_detail_screen.dart';
import 'data.dart';

class CandidatesScreen extends StatelessWidget {
  const CandidatesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidates'),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final candidate = candidates[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(candidate.imageUrl),
              ),
              title: Text(candidate.name),
              subtitle: Text(candidate.position),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CandidateDetailScreen(candidate: candidate),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
