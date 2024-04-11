import 'package:flutter/material.dart';
import 'data.dart';
import 'job_detail_screen.dart';

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          final job = jobListings[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(job.logoUrl),
              ),
              title: Text(job.title),
              subtitle: Text(job.company),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobDetailScreen(job: job),
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
