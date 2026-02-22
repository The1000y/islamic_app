class IslamiModel {
  final String image;
  final String title;
  final String subTitle;

  IslamiModel({
    required this.image,
    required this.subTitle,
    required this.title,
  });

  static List<IslamiModel> islmaiList = [
    IslamiModel(
      image: 'assets/images/Frame-3.png',
      subTitle: '',
      title: 'Welcome To Islmi App',
    ),
    IslamiModel(
      image: 'assets/images/kabba.png',
      subTitle: 'We Are Very Excited To Have You In Our Community',
      title: 'Welcome To Islami',
    ),
    IslamiModel(
      image: 'assets/images/welcome.png',
      subTitle: 'Read, and your Lord is the Most Generous',
      title: 'Reading the Quran',
    ),
    IslamiModel(
      image: 'assets/images/bearish.png',
      subTitle: 'Praise the name of your Lord, the Most High',
      title: 'Bearish',
    ),
    IslamiModel(
      image: 'assets/images/radio.png',
      subTitle:
          'You can listen to the Holy Quran Radio through the application for free and easily',
      title: 'Holy Quran Radio',
    ),
  ];
}
