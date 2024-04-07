import 'models.dart';

final List<Candidate> candidates = [
  Candidate(
    name: 'John Doe',
    position: 'Software Developer',
    imageUrl: 'assets/images/candidate1.jpg',
    isConnected: true,
  ),
  Candidate(
    name: 'Jane Doe',
    position: 'Product Manager',
    imageUrl: 'assets/images/candidate2.jpg',
    isConnected: false,
  ),
];

final List<Post> connectedCandidatePosts = [
  Post(
    candidate: candidates[0],
    message: 'Excited to share my latest project!',
  ),
];

final List<JobListing> jobListings = [
  JobListing(
    title: 'Senior Software Engineer',
    company: 'Tech Corp',
    logoUrl: 'assets/images/tech_corp_logo.jpg',
    description:
        'We are looking for a Senior Software Engineer to join our team.',
  ),
];
