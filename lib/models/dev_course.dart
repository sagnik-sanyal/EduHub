class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "CodeWithHarry",
    completedPercentage: .75,
    name: "Python Course for beginners",
    thumbnail: "assets/icons/python.png",
  ),
  Course(
    author: "freeCodeCamp.org",
    completedPercentage: .60,
    name: "React complete developer guide",
    thumbnail: "assets/icons/react.png",
  ),
  Course(
    author: "freeCodeCamp.org",
    completedPercentage: .75,
    name: "Dart - Beginner guide to flutter",
    thumbnail: "assets/icons/dart-programming-language.png",
  ),
  Course(
    author: "Codepur",
    completedPercentage: .75,
    name: "Master Flutter in 8 hours",
    thumbnail: "assets/icons/flutter.png",
  ),
  Course(
    author: "freeCodeCamp.org",
    completedPercentage: .60,
    name: "JavaScript - Full Programming Course",
    thumbnail: "assets/icons/js.png",
  )
];
