import '../models/models.dart';

final List<Candidate> candidates = [
  Candidate(
    name: 'Daniyal Mahmood',
    position: 'Software Developer',
    imageUrl: 'assets/images/candidate1.jpg',
    isConnected: true,
  ),
  Candidate(
    name: 'Meet Shah',
    position: 'Product Manager',
    imageUrl: 'assets/images/candidate2.jpg',
    isConnected: false,
  ),
  Candidate(
    name: 'Pavan Pater',
    position: 'Software Developer',
    imageUrl: 'assets/images/candidate1.jpg',
    isConnected: true,
  ),
  Candidate(
    name: 'Parth Pater',
    position: 'Product Manager',
    imageUrl: 'assets/images/candidate2.jpg',
    isConnected: false,
  ),
  Candidate(
    name: 'Alice Smith',
    position: 'UI/UX Designer',
    imageUrl: 'assets/images/candidate3.jpg',
    isConnected: false,
  ),
];

final List<Post> connectedCandidatePosts = [
  Post(
    candidate: candidates[0],
    message: 'Excited to share my latest project!',
  ),
  Post(
    candidate: candidates[1],
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
  JobListing(
    title: 'Senior Software Engineer',
    company: 'Tech Corp',
    logoUrl: 'assets/images/tech_corp_logo.jpg',
    description:
        'We are looking for a Senior Software Engineer to join our team.',
  ),
  JobListing(
    title: 'Senior Software Engineer',
    company: 'Tech Corp',
    logoUrl: 'assets/images/tech_corp_logo.jpg',
    description:
        'We are looking for a Senior Software Engineer to join our team.',
  ),
];
