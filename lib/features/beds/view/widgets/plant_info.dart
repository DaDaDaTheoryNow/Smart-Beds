import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/curve.dart';

class PlantInfo extends StatelessWidget {
  const PlantInfo({
    required this.plantType,
    required this.plantName,
    required this.image,
    required this.onAdd,
    Key? key,
  }) : super(key: key);

  final String plantType;
  final String plantName;
  final String image;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200.h,
          width: 160.w,
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
            constraints: BoxConstraints(maxWidth: 110.w, maxHeight: 240.h),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 70.r,
                backgroundImage: imageProvider,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                    margin: EdgeInsets.only(left: 10.w, right: 20.w),
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
        Positioned(
          top: 10.h,
          left: 70.w,
          child: Container(
            constraints: BoxConstraints(maxWidth: 80.w, maxHeight: 70.h),
            margin: EdgeInsets.only(left: 10.w, right: 20.w),
            padding: EdgeInsets.symmetric(
              vertical: 6.h,
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: kGinColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: onAdd,
              child: const Text(
                "+",
                style: TextStyle(color: kDarkGreenColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
