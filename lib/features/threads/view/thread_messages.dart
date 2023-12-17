import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/custom_text_field.dart';
import 'package:smart_beds/features/threads/controller/controller.dart';

class ThreadMessagesPage extends GetView<ThreadsController> {
  const ThreadMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: kGinColor,
        centerTitle: true,
        title: Text(
          "Thread Messages",
          style: GoogleFonts.poppins(
            color: kDarkGreenColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            await Future.delayed(const Duration(milliseconds: 350));
            Get.back();
          },
        ),
      ),
      body: Obx(
        () => (!controller.state.isThreadMessagesLoading)
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.state.threadMessage.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              title: Text(
                                controller.state.threadMessage[index].text,
                                style: const TextStyle(
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              subtitle: const Text('Unknown User'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildInputField(),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _buildInputField() {
    return Obx(() => CustomTextField(
          textEditingController: controller.state.userMessage,
          hintText: 'Type your message...',
          isSend: true,
          onSendPressed: () {
            if (controller.state.userMessage.text.isNotEmpty) {
              controller.sendMessageToThread(
                  controller.state.userMessage.text.trim());
              controller.state.userMessage.clear();
            }
          },
          icon: Icons.message,
          obscureText: false,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {},
        ));
  }
}
