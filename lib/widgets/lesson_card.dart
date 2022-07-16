import 'package:edu_hub_flutter/constants/color.dart';
import 'package:edu_hub_flutter/constants/color_pallete.dart';
import 'package:flutter/material.dart';
import '../models/lesson_details.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  const LessonCard({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        lesson.isPlaying
            ? const Icon(
                Icons.play_circle_rounded,
                size: 45,
                color: kBlueColor,
              )
            : const Icon(
                Icons.queue_play_next_rounded,
                size: 45,
                color: Colors.grey,
              ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                lesson.duration,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        lesson.isCompleted
            ? const Icon(
                Icons.done_rounded,
                color: Colors.green,
                size: 30,
              )
            : Icon(
                Icons.lock,
                color: Colors.grey.shade500,
                size: 30,
              )
      ],
    );
  }
}
