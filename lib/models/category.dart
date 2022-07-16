class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Business',
    noOfCourses: 4,
    thumbnail: 'assets/images/marketing.png',
  ),
  Category(
    name: 'Development',
    noOfCourses: 5,
    thumbnail: 'assets/images/ux_big.png',
  ),
  Category(
    name: 'Photography',
    noOfCourses: 5,
    thumbnail: 'assets/images/photography.png',
  ),
  Category(
    name: 'UI Designing',
    noOfCourses: 5,
    thumbnail: 'assets/images/business.png',
  ),
];
