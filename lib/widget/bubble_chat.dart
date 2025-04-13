import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BubbleChat extends StatefulWidget {
  const BubbleChat({
    super.key,
    required this.message,
    required this.role,
    required this.context,
  });

  final String message;
  final String role;
  final BuildContext context;

  @override
  State<BubbleChat> createState() => _BubbleChatState();
}

class _BubbleChatState extends State<BubbleChat> {
  bool isLike = false;
  bool isDisLike = false;
  bool isCopy = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.role == "model" ? Alignment.centerLeft : Alignment.centerRight,
      child:
          widget.role == "model"
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff404040),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset("assets/ai_icon.png"),
                  ),
                  Container(
                    padding: EdgeInsets.all(14),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.65,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff404040),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Text(
                          widget.message.trim(),
                          style: GoogleFonts.kodchasan(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 12,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isDisLike) {
                                    isDisLike = !isDisLike;
                                    isLike = !isLike;
                                  } else {
                                    isLike = !isLike;
                                  }
                                });
                              },
                              child: Icon(
                                IconsaxPlusLinear.like_1,
                                size: 20,
                                color:
                                    isLike ? Colors.white : Color(0xff777777),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isLike) {
                                    isDisLike = !isDisLike;
                                    isLike = !isLike;
                                  } else {
                                    isDisLike = !isDisLike;
                                  }
                                });
                              },
                              child: Icon(
                                IconsaxPlusLinear.dislike,
                                size: 20,
                                color:
                                    isDisLike
                                        ? Colors.white
                                        : Color(0xff777777),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isCopy = true;
                                });
                                await Clipboard.setData(
                                  ClipboardData(text: widget.message),
                                );
                              },
                              child: Icon(
                                IconsaxPlusLinear.copy,
                                size: 20,
                                color:
                                    isCopy ? Colors.white : Color(0xff777777),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : Container(
                padding: EdgeInsets.all(14),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff404040),
                ),
                child: Text(
                  widget.message.trim(),
                  style: GoogleFonts.kodchasan(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
    );
  }
}
