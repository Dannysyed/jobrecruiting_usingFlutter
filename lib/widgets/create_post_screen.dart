import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/models.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});
  //  Creation of the stateful
  @override
  State<CreatePostScreen> createState() {
    return _CreatePostScreenState();
  }
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  bool _isJobListing = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_isJobListing) {
        jobListings.add(JobListing(
          title: _title,
          company: 'Your Company',
          logoUrl: 'assets/images/default_logo.png',
          description: _description,
        ));
      } else {
        connectedCandidatePosts.add(Post(
          candidate: candidates[0],
          message: _description,
        ));
      }

      _formKey.currentState!.reset();
      setState(() {
        _isJobListing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post created successfully!')),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
                onSaved: (value) => _description = value!,
                maxLines: 3,
              ),
              SwitchListTile(
                title: const Text('Is this a job listing?'),
                value: _isJobListing,
                onChanged: (bool value) {
                  setState(() {
                    _isJobListing = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
