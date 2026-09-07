import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';

Future<void> showChatBottomSheet(
  BuildContext context, {
  String title = 'KARACHI SPORTS ARENA',
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ChatBottomSheet(title: title),
  );
}

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet({super.key, required this.title});

  final String title;

  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: 'Lorem Ipsum !',
      time: '04:45 PM',
      isMine: false,
      avatar: AssetsImages.p1,
    ),
    _ChatMessage(
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
      time: '04:45 PM',
      isMine: true,
      avatar: AssetsImages.p1,
    ),
    _ChatMessage(
      text: 'Lorem Ipsum !',
      time: '04:45 PM',
      isMine: false,
      avatar: AssetsImages.p1,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        _ChatMessage(
          text: text,
          time: '04:45 PM',
          isMine: true,
          avatar: AssetsImages.p1,
        ),
      );
      _messageController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.72,
        decoration: BoxDecoration(
          color: const Color(0xFF1B1C2D),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        child: Column(
          children: [
            10.verticalSpace,
            Container(
              width: 48.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(999.r),
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.green.withValues(alpha: 0.6),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.green,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontFamily: AppFonts.rocket,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                ],
              ),
            ),
            12.verticalSpace,
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _ChatBubble(message: _messages[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
              child: Container(
                height: 54.h,
                padding: EdgeInsets.only(left: 18.w, right: 6.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF23243A),
                  borderRadius: BorderRadius.circular(999.r),
                  border: Border.all(
                    color: AppColors.green.withValues(alpha: 0.55),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white,
                        ),
                        cursorColor: AppColors.green,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Type Message.....',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.satoshi,
                            color: AppColors.white.withValues(alpha: 0.45),
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        width: 42.w,
                        height: 42.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.send_rounded,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  const _ChatMessage({
    required this.text,
    required this.time,
    required this.isMine,
    required this.avatar,
  });

  final String text;
  final String time;
  final bool isMine;
  final String avatar;
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.message});

  final _ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final bubble = Container(
      constraints: BoxConstraints(maxWidth: 240.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: message.isMine
            ? const Color(0xFFE8E8E8)
            : AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
          bottomLeft: Radius.circular(message.isMine ? 16.r : 4.r),
          bottomRight: Radius.circular(message.isMine ? 4.r : 16.r),
        ),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: AppFonts.satoshi,
          color: Colors.black87,
          height: 1.35,
        ),
      ),
    );

    final avatar = ClipOval(
      child: Image.asset(
        message.avatar,
        width: 34.w,
        height: 34.w,
        fit: BoxFit.cover,
      ),
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment:
            message.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: message.isMine
                ? [bubble, 8.horizontalSpace, avatar]
                : [avatar, 8.horizontalSpace, bubble],
          ),
          4.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            child: Text(
              message.time,
              style: TextStyle(
                fontSize: 11.sp,
                fontFamily: AppFonts.satoshi,
                color: AppColors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
