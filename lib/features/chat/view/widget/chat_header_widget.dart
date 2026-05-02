import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telware_cross_platform/core/theme/palette.dart';
import 'package:telware_cross_platform/core/utils.dart';

class ChatHeaderWidget extends ConsumerWidget {
  final String title;
  final String subtitle;
  final String? photo;
  final Uint8List? imageBytes;

  const ChatHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.photo,
    this.imageBytes
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: title == 'Saved Messages'
              ? const AssetImage('assets/icon/saved_messages.png') as ImageProvider
              : (imageBytes != null ? MemoryImage(imageBytes!) : null),
          backgroundColor: (title != 'Saved Messages' && imageBytes == null) ? Palette.primary : null,
          child: (title != 'Saved Messages' && imageBytes == null)
              ? Text(
                  getInitials(title),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.primaryText,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Palette.primaryText,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 10,
                  color: Palette.accentText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        )
      ],
    );
  }
}
