import 'package:flutter/material.dart';
import '../data/data.dart';
import 'job_detail_screen.dart';

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({Key? key}) : super(key: key);

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
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(job.logoUrl),
                ),
                title: Text(
                  job.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
            ),
          );
        },
      ),
    );
  }
}
