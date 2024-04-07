import 'package:flutter/material.dart';
import 'models.dart';

class HomeScreen extends StatelessWidget {
  final List<Candidate> connectedCandidates = [
    Candidate(
        name: 'John Doe',
        position: 'Software Developer',
        imageUrl: 'assets/images/john_doe.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: connectedCandidates.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(connectedCandidates[index].imageUrl),
              title: Text(connectedCandidates[index].name),
              subtitle: Text(connectedCandidates[index].position),
            ),
          );
        },
      ),
    );
  }
}
