// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_5/provider/contact_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ContactFieldSheet extends StatelessWidget {
//   final TextEditingController name;
//   final TextEditingController phone;
//   final GlobalKey<FormState> formKey;
//   final void Function() onSubmit;
//   final VoidCallback onTapImage;
//   const ContactFieldSheet(
//       {super.key,
//       required this.name,
//       required this.phone,
//       required this.formKey,
//       required this.onTapImage,
//       required this.onSubmit});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: double.infinity,
//         height: MediaQuery.sizeOf(context).height * 6,
//         decoration: BoxDecoration(
//             color: Theme.of(context).scaffoldBackgroundColor,
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16), topRight: Radius.circular(16))),
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
//         child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(Icons.close)),
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(Icons.check))
//                   ],
//                 ),
//                 Center(
//                   child: GestureDetector(
//                     onTap: onTapImage,
//                     child: Stack(
//                       alignment: Alignment.bottomRight,
//                       children: [
//                         Consumer(builder: (context, ref, child) {
//                           return CircleAvatar(
//                             radius: 88,
//                             backgroundImage: ref.watch(imageProvider) == null
//                                 ? null
//                                 : FileImage(
//                                     File(ref.watch(imageProvider)!.path)),
//                             child: ref.watch(imageProvider) == null
//                                 ? Icon(
//                                     Icons.person,
//                                     size: 8 * 6,
//                                   )
//                                 : null,
//                           );
//                         }),
//                         Positioned(
//                             bottom: 8,
//                             right: 16,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.deepPurple),
//                               padding: EdgeInsets.all(3),
//                               child: Icon(
//                                 Icons.photo_camera,
//                                 color: Colors.white,
//                               ),
//                             ))
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 TextFormField(
//                   controller: name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.redAccent)),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                     hintText: 'Enter phone number',
//                     prefixIcon: Icon(Icons.phone_android),
//                     counterText: '',
//                   ),
//                   maxLength: 10,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'phone number cannot be empty';
//                     }
//                     if (value.length < 10) {
//                       return 'enter a valid number';
//                     }
//                     return null;
//                   },
//                   keyboardType: TextInputType.phone,
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
