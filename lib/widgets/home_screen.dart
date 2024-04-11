import 'package:flutter/material.dart';
import 'create_post_screen.dart';
import '../data/data.dart';
import 'candidate_detail_screen.dart';
import 'job_listings_screen.dart';
import 'candidates_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePostScreen()),
              ).then((value) {
                if (value == true) {
                  (context as Element).reassemble();
                }
              });
            },
            tooltip: 'Create Post',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Latest Posts',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                (context as Element).reassemble();
              },
              child: connectedCandidatePosts.isEmpty
                  ? const Center(child: Text('No posts to show'))
                  : ListView.builder(
                      itemCount: connectedCandidatePosts.length,
                      itemBuilder: (context, index) {
                        final post = connectedCandidatePosts[index];
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(post.candidate.imageUrl),
                                ),
                                title: Text(post.candidate.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(post.message),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CandidateDetailScreen(
                                              candidate: post.candidate),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -3),
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
                  icon: const Icon(Icons.people),
                  label: const Text('Candidates'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                  icon: const Icon(Icons.work),
                  label: const Text('Job Listings'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
