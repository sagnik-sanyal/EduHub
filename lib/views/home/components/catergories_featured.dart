// ignore_for_file: must_be_immutable

import 'package:animations/animations.dart';
import 'package:edu_hub_flutter/constants/color_pallete.dart';
import 'package:edu_hub_flutter/views/home/business_screen/business_course_screen.dart';
import 'package:edu_hub_flutter/views/home/components/flutter_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color.dart';
import '../../../constants/size.dart';
import '../../../models/category.dart';
import '../../../widgets/circle_button.dart';
import '../../../widgets/search_testfield.dart';
import 'dev_course_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(),
                  const Body(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  static const List<Widget> goToScreens = <Widget>[
    BusinessCourseScreen(),
    DevelopmentCourseScreen(),
    DevelopmentCourseScreen(),
    BusinessCourseScreen(),
  ];

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Categories",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
        AnimationLimiter(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8,
            mainAxisSpacing: 24,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            shrinkWrap: true,
            children: List.generate(
              categoryList.length,
              (index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 2,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: CategoryCard(
                        category: categoryList[index],
                        goTo: Body.goToScreens[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final Widget goTo;
  const CategoryCard({
    Key? key,
    required this.category,
    required this.goTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        closedElevation: 4,
        closedBuilder: (context, action) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(category.thumbnail),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 4.0,
                    spreadRadius: .05,
                  ), //BoxShadow
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      category.name,
                      style: kTitleTextStyle,
                    ),
                    Text(
                      "${category.noOfCourses.toString()} courses",
                      style: TextStyle(
                          color: kTextColor.withOpacity(.5),
                          fontSize: ScreenUtil().setSp(14)),
                    ),
                  ],
                ),
              ),
            ),
        openBuilder: (context, action) {
          return goTo;
        });
  }
}

class AppBar extends StatelessWidget {
  AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: ScreenUtil().setHeight(210),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/Colors Icon.png",
            ),
            alignment: Alignment.topCenter),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greetUser(context),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField()
        ],
      ),
    );
  }

  Widget greetUser(context) {
    DateTime now = DateTime.now();
    if (now.hour < 12) {
      return Text(
        "Hello,\nGood Morning",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.white),
      );
    } else if (now.hour >= 12 && now.hour < 18) {
      return Text(
        "Hello,\nGood Afternoon",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.white),
      );
    } else if (now.hour >= 18 && now.hour < 24) {
      return Text(
        "Hello,\nGood Evening",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.white),
      );
    }
    return const Text('');
  }
}
