import 'package:flutter/material.dart';
import 'data.dart';
import 'models.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
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
        title: Text('Create Post'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a description' : null,
                onSaved: (value) => _description = value!,
                maxLines: 3,
              ),
              SwitchListTile(
                title: Text('Is this a job listing?'),
                value: _isJobListing,
                onChanged: (bool value) {
                  setState(() {
                    _isJobListing = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
