import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final Color borderColor;
  final double borderWidth;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size = 50.0,
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipOval(
        child: imageUrl == null || imageUrl == ''
            ? CircleAvatar(
                backgroundColor: Colors.grey,
                radius: size ,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            : imageUrl!.contains('http')
                ? CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildPlaceholder(),
        )
                : Image.file(
                    File(imageUrl!),
                    fit: BoxFit.cover,
                  ),

      ),
    );
  }

  Widget _buildPlaceholder() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return ClipOval(
      child: Image.asset(
        'assets/images/default_avatar.png', // Provide a default image
        fit: BoxFit.cover,
      ),
    );
  }
}

