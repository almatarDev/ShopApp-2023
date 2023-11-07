class OnBoardingModel {
  final String title;
  final String content;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.content,
    required this.image,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: 'onBoarding 1',
      content: 'content 1',
      image: 'assets/images/onboard_1.jpg'),
  OnBoardingModel(
      title: 'onBoarding 2',
      content: 'content 2',
      image: 'assets/images/onboard_1.jpg'),
  OnBoardingModel(
      title: 'onBoarding 3',
      content: 'content 3',
      image: 'assets/images/onboard_1.jpg'),
];
