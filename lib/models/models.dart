class Candidate {
  final String name;
  final String position;
  final String imageUrl;
  bool isConnected;

  Candidate({
    required this.name,
    required this.position,
    required this.imageUrl,
    this.isConnected = false,
  });
}

class Post {
  final Candidate candidate;
  final String message;

  Post({required this.candidate, required this.message});
}

class JobListing {
  final String title;
  final String company;
  final String logoUrl;
  final String description;

  JobListing(
      {required this.title,
      required this.company,
      required this.logoUrl,
      required this.description});
}
