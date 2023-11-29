import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key, this.pickedImage, required this.function});

  final XFile? pickedImage;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        pickedImage == null
            ? const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('assets/images/profile.gif'),
              )
            : Material(
                shape: const CircleBorder(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
        Positioned(
          top: -7,
          left: 80,
          child: IconButton(
            onPressed: () {
              function();
            },
            icon: const Icon(
              Icons.add_a_photo,
            ),
          ),
        )
      ],
    );
  }
}
