import 'package:flutter/material.dart';

import 'create_post_screen.dart';
import '../data/data.dart';
import 'candidate_detail_screen.dart';
import 'job_listings_screen.dart';
import 'candidates_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshPosts() async {
    // Simulating here a delay to show the refresh indicator
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).primaryColor, // Set app bar color
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreatePostScreen(),
                ),
              );
              setState(() {});
            },
            tooltip: 'Create Post',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Latest Posts',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshPosts,
              child: _buildPostsList(),
            ),
          ),
          _buildFooterButtons(),
        ],
      ),
    );
  }

  Widget _buildPostsList() {
    return connectedCandidatePosts.isEmpty
        ? const Center(child: Text('No posts to show'))
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height -
                      200, // Adjust height as needed
                  child: ListView.builder(
                    itemCount: connectedCandidatePosts.length,
                    itemBuilder: (context, index) {
                      final post = connectedCandidatePosts[index];
                      return Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(post.candidate.imageUrl),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                post.candidate.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          subtitle: Text(post.message),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.thumb_up),
                                onPressed: () {
                                  // Implement like functionality
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.comment),
                                onPressed: () {
                                  // Implement comment functionality
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CandidateDetailScreen(
                                  candidate: post.candidate,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildFooterButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 207, 208, 220),
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
                  builder: (context) => const CandidatesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.people),
            label: const Text('Candidates'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const JobListingsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.work),
            label: const Text('Job Listings'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
