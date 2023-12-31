import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/curve.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({
    required this.plantType,
    required this.bedId,
    required this.plantName,
    required this.image,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String plantType;
  final String plantName;
  final String image;
  final int bedId;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 220.h,
            width: 185.w,
            decoration: BoxDecoration(
              color: kGinColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          Positioned(
            left: 8.0.w,
            bottom: 70.0.h,
            child: Container(
              constraints: BoxConstraints(maxWidth: 124.w, maxHeight: 240.h),
              child: Hero(
                tag: bedId,
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 70.r,
                    backgroundImage: imageProvider,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0.h,
            left: 0.0.w,
            child: Container(
              width: 185.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      plantName,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        color: kDarkGreenColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: kFoamColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      constraints: BoxConstraints(maxWidth: 90.w),
                      child: Text(
                        plantType,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          color: kDarkGreenColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.8.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
