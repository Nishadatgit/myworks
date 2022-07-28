class Tutor {
  final String name;
  final String about;
  final double rating;
  final String imageUrl;

  Tutor(this.name, this.about, this.rating, this.imageUrl);
}

List<Tutor> tutors = [
  Tutor(
    'Greg',
    'A good abled person',
    3.2,
    'assets/images/greg.jpg',
  ),
  Tutor(
    'James',
    'A good abled person',
    3.0,
    'assets/images/james.jpg',
  ),
  Tutor(
    'Jhon',
    'A skilled in physics',
    4.5,
    'assets/images/john.jpg',
  ),
  Tutor(
    'Olivia',
    'A talkative person with good skills',
    4.0,
    'assets/images/olivia.jpg',
  ),
];
