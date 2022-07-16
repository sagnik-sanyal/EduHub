import 'package:animate_do/animate_do.dart';
import 'package:edu_hub_flutter/views/home/business_screen/components/business_course_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/color.dart';
import '../../../constants/color_pallete.dart';
import '../../../models/business_course.dart';
import '../../../widgets/custom_icon_button.dart';
import '../components/flutter_details.dart';
import '../components/dev_course_screen.dart';

class BusinessCourseScreen extends StatefulWidget {
  const BusinessCourseScreen({Key? key}) : super(key: key);

  @override
  State<BusinessCourseScreen> createState() => _BusinessCourseScreenState();
}

class _BusinessCourseScreenState extends State<BusinessCourseScreen> {
  final scrollController = ScrollController();
  bool _isBuyCartVisible = true;
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
    if (!_isBuyCartVisible) {
      setState(() {
        _isBuyCartVisible = true;
      });
    }
  }

  void hide() {
    if (_isBuyCartVisible) {
      setState(() {
        _isBuyCartVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: ScreenUtil().setHeight(60),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIconButton(
              height: ScreenUtil().setHeight(35),
              width: ScreenUtil().setHeight(35),
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
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
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/images/marketing.png",
                height: ScreenUtil().setHeight(365),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                width: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                        top: ScreenUtil().setHeight(50),
                        right: 20),
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          childAnimationBuilder: (widget) => SlideAnimation(
                              verticalOffset: 20,
                              duration: const Duration(milliseconds: 500),
                              delay: const Duration(milliseconds: 50),
                              child: widget),
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            Row(
                              children: [
                                ClipPath(
                                  clipper: BestSellerClipper(),
                                  child: Container(
                                    color: kGreenColor,
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 20, bottom: 5),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade800,
                                      highlightColor: Colors.white,
                                      child: const Text(
                                        "NEWLY LAUNCHED",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(6),
                                ),
                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: " @ ₹999/- only",
                                        style: kHeadingTextStyle.copyWith(
                                            fontSize: ScreenUtil().setSp(18),
                                            color: Color(0xFFf96d6d)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ScreenUtil().setHeight(15)),
                            Text(
                              'Business',
                              style: kHeadingTextStyle.copyWith(
                                  color: Color(0xFFf96d6d)),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(9)),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.people_alt_rounded,
                                  color: Color(0xFFe04b5a),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(5),
                                ),
                                Text(
                                  "5K+",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: Color(0xFFf96d6d)),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(20),
                                ),
                                const Icon(
                                  Icons.star_half_rounded,
                                  color: Color(0xFFe04b5a),
                                ),
                                Text(
                                  "3.9",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: Color(0xFFf96d6d)),
                                )
                              ],
                            ),
                            SizedBox(height: ScreenUtil().setHeight(30)),
                          ],
                        ),
                      ),
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
                                                  milliseconds: 70),
                                              child: FadeInAnimation(
                                                child: BusinessCourseContainer(
                                                    course: courses[index]),
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
                              height: _isBuyCartVisible
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
                                          borderRadius:
                                              BorderRadius.circular(40),
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
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class NewlyLaunchedClipper extends CustomClipper<Path> {
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
