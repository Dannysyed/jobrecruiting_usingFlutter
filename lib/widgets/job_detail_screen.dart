import 'package:flutter/material.dart';
import '../models/models.dart';

// Global variable is stored here to make sure app remember applied job titles
Set<String> appliedJobs = {};

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key, required this.job});

  final JobListing job;

  @override
  State<JobDetailScreen> createState() {
    return _JobDetailScreenState();
  }
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isApplied = appliedJobs.contains(widget.job.title);

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
              widget.job.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.job.company,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              widget.job.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            if (!isApplied)
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Apply'),
                        content: Text(
                            'Are you sure you want to apply for ${widget.job.title}?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                appliedJobs.add(widget.job.title);
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Apply'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Apply Now'),
              ),
            if (isApplied)
              const Text(
                'You have applied for this job.',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
