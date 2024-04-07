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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePostScreen()),
              );
            },
            tooltip: 'Create Post',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Latest Posts',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: connectedCandidatePosts.length,
              itemBuilder: (context, index) {
                final post = connectedCandidatePosts[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(post.candidate.imageUrl),
                    ),
                    title: Text(post.candidate.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(post.message),
                    ),
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
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CandidatesScreen()),
                    );
                  },
                  icon: Icon(Icons.people),
                  label: Text('Candidates'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobListingsScreen()),
                    );
                  },
                  icon: Icon(Icons.work),
                  label: Text('Job Listings'),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
