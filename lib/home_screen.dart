import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import 'data.dart';
import 'candidate_detail_screen.dart';
import 'job_listings_screen.dart';
import 'candidates_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.blueGrey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CandidatesScreen()),
                    );
                  },
                  child: Text('View Candidates'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobListingsScreen()),
                    );
                  },
                  child: Text('View Job Listings'),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Create Post',
      ),
    );
  }
}
