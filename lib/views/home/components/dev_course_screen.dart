import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/color.dart';
import '../../../constants/color_pallete.dart';
import '../../../models/dev_course.dart';
import 'dart_details.dart';
import 'flutter_details.dart';
import 'javascript_details.dart';
import 'python_details.dart';
import 'react_details.dart';

class DevelopmentCourseScreen extends StatefulWidget {
  const DevelopmentCourseScreen({Key? key}) : super(key: key);

  @override
  _DevelopmentCourseScreenState createState() =>
      _DevelopmentCourseScreenState();
}

class _DevelopmentCourseScreenState extends State<DevelopmentCourseScreen> {
  final scrollController = ScrollController();
  bool isBuyCartVisible = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(listen);
  }

  void listen() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isBuyCartVisible) {
      setState(() {
        isBuyCartVisible = true;
      });
    }
  }

  void hide() {
    if (isBuyCartVisible) {
      setState(() {
        isBuyCartVisible = false;
      });
    }
  }

  List<Widget> devLocations = <Widget>[
    PythonDetailsScreen(),
    ReactDetailsScreen(),
    DartDetailsScreen(),
    FlutterDetailsScreen(),
    JavaScriptDetailsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: ScreenUtil().setHeight(60),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                height: ScreenUtil().setHeight(35),
                width: ScreenUtil().setHeight(35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 2.0,
                      spreadRadius: .1,
                    ), //BoxShadow
                  ],
                ),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              'About this Course',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20), color: Colors.black),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F4EF),
              image: DecorationImage(
                image: AssetImage("assets/images/ux_big.png"),
                alignment: Alignment.topRight,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                  child: AnimationLimiter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 20,
                            duration: const Duration(milliseconds: 500),
                            delay: const Duration(milliseconds: 50),
                            child: widget,
                          ),
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            ClipPath(
                              clipper: BestSellerClipper(),
                              child: Container(
                                color: kBestSellerColor,
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, right: 20, bottom: 5),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade800,
                                  highlightColor: Colors.white,
                                  child: const Text(
                                    "BESTSELLER",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(15)),
                            Text(
                              'Development',
                              style: kHeadingTextStyle,
                            ),
                            SizedBox(height: ScreenUtil().setHeight(15)),
                            Row(
                              children: <Widget>[
                                const Icon(Icons.people_alt_rounded),
                                SizedBox(
                                  width: ScreenUtil().setWidth(5),
                                ),
                                Text(
                                  "20K+",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16)),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                const Icon(Icons.star_half_rounded),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16)),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "₹1999/-",
                                    style: kHeadingTextStyle.copyWith(
                                      fontSize: ScreenUtil().setSp(27),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₹4999/-",
                                    style: TextStyle(
                                      color: kTextColor.withOpacity(.5),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(70)),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeIn(
                                delay: const Duration(milliseconds: 100),
                                duration: const Duration(milliseconds: 500),
                                child: Text("Course Contents",
                                    style: kTitleTextStyle),
                              ),
                              Expanded(
                                child: AnimationLimiter(
                                  child: ListView.separated(
                                      controller: scrollController,
                                      padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(20)),
                                      separatorBuilder: (_, __) {
                                        return SizedBox(
                                          height: ScreenUtil().setHeight(15),
                                        );
                                      },
                                      itemCount: courses.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          child: SlideAnimation(
                                            horizontalOffset: 50,
                                            duration: const Duration(
                                                milliseconds: 700),
                                            delay: const Duration(
                                                milliseconds: 50),
                                            child: FadeInAnimation(
                                              child: CourseContainer(
                                                course: courses[index],
                                                goTo: devLocations[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.all(
                              ScreenUtil().setWidth(20),
                            ),
                            height: isBuyCartVisible
                                ? ScreenUtil().setHeight(90)
                                : 0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 50,
                                  color: kTextColor.withOpacity(.1),
                                ),
                              ],
                            ),
                            child: Wrap(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: ScreenUtil().setHeight(60),
                                      width: ScreenUtil().setWidth(80),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFEDEE),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Center(
                                        child: LikeButton(
                                          size: ScreenUtil().setHeight(30),
                                          likeCountAnimationType:
                                              LikeCountAnimationType.all,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(20),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: ScreenUtil().setHeight(60),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: kPrimaryColor,
                                        ),
                                        child: Text(
                                          "Buy Now",
                                          style: kSubtitleTextStyle.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(listen);
    super.dispose();
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class CourseContainer extends StatelessWidget {
  final Course course;
  final Widget goTo;
  const CourseContainer({
    Key? key,
    required this.course,
    required this.goTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => goTo),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name),
                  Text(
                    "Author : ${course.author}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: course.completedPercentage,
                    backgroundColor: Colors.black12,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
