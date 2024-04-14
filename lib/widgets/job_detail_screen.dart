import 'package:flutter/material.dart';
import '../models/models.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({Key? key, required this.job}) : super(key: key);

  final JobListing job;

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  Set<String> appliedJobs = {}; // Set to store titles of applied jobs

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
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                appliedJobs.add(widget
                                    .job.title); // Mark job title as applied
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Apply'),
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
