import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

Widget inputText({
  required GestureTapCallback func,
  required TextEditingController controller,
}) => Container(
  padding: const EdgeInsets.symmetric(vertical: 10),
  decoration: BoxDecoration(color: Color(0xff171717)),
  child: Row(
    spacing: 6,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: SizedBox(
          height: 52,
          child: TextField(
            controller: controller,
            style: GoogleFonts.kodchasan(color: Colors.white, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              prefixIcon: Container(
                decoration: BoxDecoration(),
                child: Icon(IconsaxPlusLinear.link_1, color: Colors.white),
              ),
              filled: true,
              hintText: "Ask everything",
              hintStyle: GoogleFonts.kodchasan(color: Color(0xff8A8A8A)),
              fillColor: Color(0xff404040),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(100),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: func,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff404040),
            borderRadius: BorderRadius.circular(100),
          ),
          width: 50,
          height: 50,
          child: Icon(IconsaxPlusLinear.send_1, color: Colors.white),
        ),
      ),
    ],
  ),
);
