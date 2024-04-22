
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
    required this.voted,
  });

  final double rating;
  final bool voted;

  @override
  Widget build(BuildContext context) {
    String ratingToShow = voted == false ? '--' : rating.toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(ratingToShow),
    );
  }
}
