import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_chatbot/widget/input_text.dart';
import 'package:ai_chatbot/widget/bubble_chat.dart';
import 'package:ai_chatbot/services/gemini.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> chats = [];
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  Future<void> sendMessage() async {
    if (_controller.text.trim().isEmpty) return;
    String prompt = _controller.text.trim();

    setState(() {
      isLoading = true;
      chats.addAll([
        {"text": _controller.text, "role": "user"},
      ]);

      _controller.clear();
    });

    try {
      final response = await Gemini.generateContent(prompt: prompt);
      setState(() {
        isLoading = false;
        chats.addAll([
          {"text": response, "role": "model"},
        ]);
      });
    } catch (e) {
      setState(() {
        chats.addAll([
          {"text": "Terjadi kesalahan pada server", "role": "model"},
        ]);
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(),
          child: Row(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/star.png"),
              Text(
                "Chat Bot",
                style: GoogleFonts.kodchasan(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Stack(
          children: [
            ListView.separated(
              padding: EdgeInsets.only(bottom: 80),
              separatorBuilder: (context, index) => Gap(12),
              itemCount: chats.length,
              itemBuilder:
                  (context, index) => BubbleChat(
                    message: chats[index]["text"],
                    role: chats[index]["role"],
                    context: context,
                  ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: inputText(controller: _controller, func: sendMessage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
