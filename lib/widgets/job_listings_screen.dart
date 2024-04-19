import 'package:flutter/material.dart';
import '../data/data.dart';
import 'job_detail_screen.dart';

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: ListView.separated(
        itemCount: jobListings.length,
        separatorBuilder: (context, index) => Divider(
          height: 0,
          color: Colors.grey[300],
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) {
          final job = jobListings[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: job),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(job.logoUrl),
                ),
                title: Text(
                  job.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                subtitle: Text(job.company),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
