import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class ContactModel {
  final File? imageFile;
  final String name;
  final String phone;
  const ContactModel({
    this.imageFile,
    
    
    required this.name, required this.phone});

  ContactModel copyWith({
    String? name,
    String? phone,
    File? imageFile,
  }) {
    return ContactModel(
      imageFile: imageFile??imageFile,
      name: name ?? this.name, phone: phone ?? this.phone);
  }
}
