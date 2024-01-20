import 'package:flutter/material.dart';

class RatingStar extends StatefulWidget {
  const RatingStar({super.key});

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  int rating = 0;
  Widget value = const Icon(Icons.star_border);
  Widget newValue = const Icon(
    Icons.star,
    color: Colors.yellow,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => IconButton(
          iconSize: 20.1,
          onPressed: () {
            // Tăng rating nếu chưa đánh giá, giảm nếu đã đánh giá
            setState(() {
              rating = (rating == index + 1) ? rating - 1 : index + 1;
            });
          },
          icon: Icon(
            (index < rating) ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
