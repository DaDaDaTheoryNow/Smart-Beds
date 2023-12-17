import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.value,
    required this.onChanged,
    required this.soilTypes,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final String value;
  final Function(dynamic) onChanged;
  final List<String> soilTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      child: DropdownButtonFormField<String>(
        value: value,
        iconSize: 24,
        elevation: 16,
        style: GoogleFonts.poppins(
          color: kDarkGreenColor,
          fontWeight: FontWeight.w600,
          fontSize: 15.sp,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.lightGreen.shade50,
          contentPadding: const EdgeInsets.all(18.0),
          prefixIcon: Icon(
            icon,
            size: 24.0,
            color: Colors.green,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.lightGreen),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.green),
          ),
        ),
        onChanged: (newValue) {
          onChanged(newValue);
        },
        items: soilTypes.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
