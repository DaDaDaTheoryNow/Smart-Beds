import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';

class PlantMetricsWidget extends StatelessWidget {
  const PlantMetricsWidget({
    required this.title,
    required this.value,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.only(right: 28.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kDarkGreenColor,
            radius: 28.0,
            child: Icon(
              icon,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          const SizedBox(width: 12.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: kGreyColor,
                ),
              ),
              Align(
                child: Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kDarkGreenColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
