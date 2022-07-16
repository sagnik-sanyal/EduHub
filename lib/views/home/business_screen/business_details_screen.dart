import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_video_player.dart';
import '../components/flutter_details.dart';

class BusinessDetailsScreen extends StatefulWidget {
  final String title;
  const BusinessDetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _BusinessDetailsScreenState createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
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
              'Business',
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
                  videoId: "sy-KZNEO2Dk",
                  startAt: Duration(seconds: 26),
                  endAt: Duration(minutes: 1, seconds: 36),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "How to be a successful Entrepreneur ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenUtil().setSp(18),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Video by Aman Dhattarwal",
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
                      " 11 minutes",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Free",
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
