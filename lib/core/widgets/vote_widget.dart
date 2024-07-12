import 'package:flutter/material.dart';
import 'package:tmdb/core/extensions/extensions.dart';

enum VoteWidgetSize {
  small(Size.square(34), 11, 7),
  large(Size.square(44), 12, 8);

  const VoteWidgetSize(
    this.value,
    this.contentSize,
    this.percentageIconSize,
  );

  final Size value;
  final double contentSize;
  final double percentageIconSize;
}

class VoteWidget extends StatelessWidget {
  const VoteWidget({
    super.key,
    required this.voteAverage,
    this.size = VoteWidgetSize.small,
  });

  final double voteAverage;
  final VoteWidgetSize size;

  factory VoteWidget.small({
    required double voteAverage,
  }) =>
      VoteWidget(voteAverage: voteAverage);

  factory VoteWidget.large({
    required double voteAverage,
  }) =>
      VoteWidget(
        voteAverage: voteAverage,
        size: VoteWidgetSize.large,
      );

  @override
  Widget build(BuildContext context) {
    final votePercentage = (voteAverage * 10).ceil();
    final voteColor = votePercentage.color;

    return Container(
      height: size.value.height,
      width: size.value.width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: CircularProgressIndicator(
                value: voteAverage / 10,
                color: voteColor,
                backgroundColor: voteColor.withOpacity(0.5),
                strokeWidth: 3,
              ),
            ),
          ),
          Center(
            child: votePercentage > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$votePercentage',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.contentSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.percentageIconSize,
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    'NR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.contentSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
