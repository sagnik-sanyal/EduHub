class BusinessCourse {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  BusinessCourse({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<BusinessCourse> courses = [
  BusinessCourse(
    author: "Aman Dhattarwal",
    completedPercentage: .45,
    name: "How to become entrepreneur with no money ?",
    thumbnail: "assets/images/businessman.png",
  ),
  BusinessCourse(
    author: "Aman Dhattarwal",
    completedPercentage: .25,
    name: "How to boost confidence while speaking ?",
    thumbnail: "assets/images/role-model.png",
  ),
  BusinessCourse(
    author: "Ankur Warikoo",
    completedPercentage: .65,
    name: "How to become a well behaved businessman ?",
    thumbnail: "assets/images/businessman.png",
  ),
  BusinessCourse(
    author: "Aman Dhattarwal",
    completedPercentage: .55,
    name: "How to face the challenging market ?",
    thumbnail: "assets/images/role-model.png",
  ),
];
