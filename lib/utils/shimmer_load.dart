import 'package:flutter/material.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingAnimation extends StatefulWidget {
  const ShimmerLoadingAnimation({Key? key}) : super(key: key);

  @override
  State<ShimmerLoadingAnimation> createState() => _ShimmerLoadingAnimationState();
}

class _ShimmerLoadingAnimationState extends State<ShimmerLoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(child: shimmerList());
  }

  Widget shimmerList() {
    return Shimmer.fromColors(
      baseColor: DefaultColors.neutral[50]!,
      highlightColor: DefaultColors.neutral[100]!,
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  height: 40,
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 25,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
