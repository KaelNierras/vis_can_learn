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
    title: "AMDM Calculator",
    image: "assets/images/onboarding/image1.png",
    desc: "Welcome to our Automated Moment Distribution Method Calculator—your go-to tool for swift and accurate structural analysis! Whether you're an engineering enthusiast or a seasoned professional, this application is designed to streamline your moment distribution calculations with efficiency and precision.",
  ),
  OnboardingContents(
    title: "Effortless Engineering",
    image: "assets/images/onboarding/image2.png",
    desc:
        "Dive into a user-friendly interface that simplifies the time-consuming moment distribution method in structural analysis, allowing you to focus on the nuances of your project rather than intricate calculations. Let's elevate your structural engineering experience. Get ready to optimize your moments effortlessly with our cutting-edge calculator.",
  ),
  OnboardingContents(
    title: "Help us improve!",
    image: "assets/images/onboarding/image3.png",
    desc:
        "It's important to note that our app is in its early stages. We value your insights and invite you to be\na part of our development process.\nYour feedback and recommendations are highly encouraged, as we strive to enhance and refine this tool collaboratively. Feel free to share your thoughts with us, and thank you for being a part of its development.",
  ),
  OnboardingContents(
    title: "About Us",
    image: "assets/images/onboarding/image4.png",
    desc:
        "This calculator application was developed\nby this dynamic group of students:\n\nCharlemagne Abainza, Arnold Canonoy Jr.,\nKent Raven Capin, Daryl Lamoste, and\nKyle Anthony Nierras.",
  ),
];