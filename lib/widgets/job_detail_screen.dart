import 'package:flutter/material.dart';
import '../models/models.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({required this.job, super.key});

  final JobListing job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              job.company,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              job.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle apply action
                print('Applied to ${job.title}');
              },
              child: const Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}
