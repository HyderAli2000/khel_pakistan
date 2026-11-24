import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/widgets/app_circle_button.dart';

Future<void> showChatBottomSheet(
  BuildContext context, {
  String title = 'Karachi Sports Arena',
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.dark.withValues(alpha: 0.45),
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
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      text: 'Hi! Is the court available this Friday evening?',
      time: '04:41 PM',
      isMine: true,
    ),
    const _ChatMessage(
      text: 'Yes, 7–9 PM is open. Shall we hold it for you?',
      time: '04:44 PM',
      isMine: false,
    ),
    const _ChatMessage(
      text: 'Great, please do. We are 8 players.',
      time: '04:45 PM',
      isMine: true,
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
    final now = TimeOfDay.now().format(context);
    setState(() {
      _messages.add(_ChatMessage(text: text, time: now, isMine: true));
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
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.72,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        child: Column(
          children: [
            10.verticalSpace,
            Container(
              width: 44.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundImage: const AssetImage(AssetsImages.venue1),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.subtitle,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 8.r,
                              height: 8.r,
                              decoration: const BoxDecoration(
                                color: AppColors.success,
                                shape: BoxShape.circle,
                              ),
                            ),
                            5.horizontalSpace,
                            Text('Online', style: AppTextStyles.caption),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppCircleButton.close(
                    size: 36.r,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _ChatBubble(message: _messages[i]),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 12.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: AppTextStyles.input,
                        cursorColor: AppColors.textPrimary,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _sendMessage(),
                        decoration: InputDecoration(
                          hintText: 'Type a message…',
                          hintStyle: AppTextStyles.hint,
                          filled: true,
                          fillColor: AppColors.inputFill,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 14.h,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999),
                            borderSide: const BorderSide(
                              color: AppColors.border,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999),
                            borderSide: const BorderSide(color: AppColors.dark),
                          ),
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                    AppCircleButton(
                      icon: Icons.send_rounded,
                      size: 46.r,
                      background: AppColors.primary,
                      iconColor: AppColors.onPrimary,
                      onTap: _sendMessage,
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
  });

  final String text;
  final String time;
  final bool isMine;
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.message});

  final _ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final mine = message.isMine;
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Column(
          crossAxisAlignment: mine
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 260.w),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: mine ? AppColors.primary : AppColors.surface,
                border: mine ? null : Border.all(color: AppColors.divider),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(mine ? 16.r : 4.r),
                  bottomRight: Radius.circular(mine ? 4.r : 16.r),
                ),
              ),
              child: Text(
                message.text,
                style: AppTextStyles.body.copyWith(
                  fontSize: 13.sp,
                  height: 1.4,
                ),
              ),
            ),
            4.verticalSpace,
            Text(
              message.time,
              style: AppTextStyles.caption.copyWith(fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
