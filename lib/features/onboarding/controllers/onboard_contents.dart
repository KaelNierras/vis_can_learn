class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to VisCanLearn",
    image: "assets/images/onboarding/image1.png",
    desc: "Welcome to VisCanLearn, your ultimate study companion! Whether you're preparing for exams or simply enhancing your knowledge, VisCanLearn is here to support your learning journey.",
  ),
  OnboardingContents(
    title: "Effortless Study",
    image: "assets/images/onboarding/image2.png",
    desc:
    "Enjoy a seamless study experience with VisCanLearn's intuitive interface. Dive into various study modes like flashcards, quizzes, and practice tests, designed to suit your learning preferences.",
  ),
  OnboardingContents(
    title: "Join Our Community",
    image: "assets/images/onboarding/image3.png",
    desc:
    "Become a part of our vibrant community! Connect with fellow learners, share study materials, and engage in discussions. Together, we can achieve academic excellence.",
  ),
  OnboardingContents(
    title: "About VisCanLearn",
    image: "assets/images/onboarding/image4.png",
    desc:
    "VisCanLearn is developed by a team of dedicated students from Visayas State University. We are committed to providing you with a top-notch study platform. Thank you for choosing VisCanLearn!",
  ),
];
