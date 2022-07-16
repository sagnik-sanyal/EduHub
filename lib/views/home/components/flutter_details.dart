import 'package:edu_hub_flutter/constants/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:like_button/like_button.dart';
import '../../../constants/color.dart';
import '../../../models/lesson_details.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_video_player.dart';
import '../../../widgets/lesson_card.dart';

class FlutterDetailsScreen extends StatefulWidget {
  final String? title;
  const FlutterDetailsScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  _FlutterDetailsScreenState createState() => _FlutterDetailsScreenState();
}

class _FlutterDetailsScreenState extends State<FlutterDetailsScreen> {
  int _selectedTag = 0;
  final scrollController = ScrollController();
  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: ScreenUtil().setHeight(90),
            leading: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
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
              'Flutter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
                vertical: ScreenUtil().setHeight(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const CustomVideoPlayer(
                  videoId: "j-LOab_PzzU",
                  startAt: Duration(seconds: 26),
                  endAt: Duration(minutes: 1, seconds: 36),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Master Flutter in 8 hours",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Created by Codepur",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_half_rounded,
                      color: Colors.grey,
                    ),
                    Text(
                      "4.8",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    const Text(
                      " 8 Hours",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "₹1999/-",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTabView(
                  index: _selectedTag,
                  changeTab: changeTab,
                ),
                _selectedTag == 0
                    ? PlayList(
                        controller: scrollController,
                      )
                    : const Description(),
              ],
            ),
          ),
          bottomSheet: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _isBuyCartVisible ? ScreenUtil().setHeight(60) : 0,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
              child: BottomSheet(
                onClosing: () {},
                backgroundColor: Colors.white,
                enableDrag: false,
                builder: (context) {
                  return Wrap(
                    children: const [EnrollBottomSheet()],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  final ScrollController controller;
  const PlayList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.separated(
          controller: controller,
          separatorBuilder: (_, __) {
            return const SizedBox(
              height: 20,
            );
          },
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          shrinkWrap: true,
          itemCount: lessonList.length,
          itemBuilder: (_, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -30,
                child: FadeInAnimation(
                    child: LessonCard(lesson: lessonList[index])),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
          "If a person can influence someone with his talks, he can conquer this world.."),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (12)", "Description"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(30), vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: ScreenUtil().setWidth(300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _tags
                .asMap()
                .entries
                .map((MapEntry map) => _buildTags(map.key))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          LikeButton(
            size: ScreenUtil().setHeight(33),
            likeCountAnimationType: LikeCountAnimationType.all,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomIconButton(
              onTap: () {},
              color: kPrimaryColor,
              height: 45,
              width: 45,
              child: const Text(
                "Enroll Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
