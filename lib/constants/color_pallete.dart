import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Colors
const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const kBackgroundColor = Color(0xFFF5F4EF);

// My Text Styles
var kHeadingTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(28),
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
var kSubheadingTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(24),
  color: Color(0xFF61688B),
  height: 2,
);

var kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(17),
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

var kSubtitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(18),
  color: kTextColor,
);
