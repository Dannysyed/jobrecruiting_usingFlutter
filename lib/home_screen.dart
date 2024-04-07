import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import 'data.dart';
import 'candidate_detail_screen.dart';
import 'job_listings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Create Post',
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobListingsScreen()),
                );
              },
              child: const Text('View Job Listings'),
            ),
          ],
        ),
      ),
    );
  }
}
