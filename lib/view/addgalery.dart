import 'package:flutter/material.dart';
import 'package:flutter_application_5/provider/contact_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

showGallery(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text("Choose a picture"),
    content: Row(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return TextButton.icon(
                onPressed: () async {
                  final imagepicker = ImagePicker();
                  XFile? image =
                      await imagepicker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    Navigator.pop(context);
                  }
                  ref.read(imageProvider.notifier).state = image;
                },
                icon: const Icon(Icons.photo_library_outlined),
                label: const Text('Gallery'));
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return TextButton.icon(
                onPressed: () async {
                  final imagePicker = ImagePicker();
                  XFile? image =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    Navigator.pop(context);
                  }
                  ref.read(imageProvider.notifier).state = image;

                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       title: Text("cam"),
                  //       content: TextField(
                  //         decoration:
                  //             InputDecoration(border: OutlineInputBorder()),
                  //       ),
                  //       actions: [
                  //         TextButton(onPressed: () {}, child: Text("save")),
                  //         TextButton(onPressed: () {}, child: Text("save"))
                  //       ],
                  //     );
                  //   },
                  // );
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Camera'));
          },
        )
      ],
    ),
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}
