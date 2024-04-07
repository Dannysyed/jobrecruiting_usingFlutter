import 'package:flutter/material.dart';
import 'data.dart';
import 'candidate_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: connectedCandidatePosts.length,
        itemBuilder: (context, index) {
          final post = connectedCandidatePosts[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(post.candidate.imageUrl),
              ),
              title: Text(post.candidate.name),
              subtitle: Text(post.message),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CandidateDetailScreen(candidate: post.candidate),
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
