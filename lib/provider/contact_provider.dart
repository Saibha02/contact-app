import 'package:flutter_application_5/model/contact_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ContactNotifier extends Notifier<List<ContactModel>> {
  @override
  List<ContactModel> build() {
    return [];
  }

  void addContact(ContactModel contact) {
    state = [contact, ...state];
  }
    void removeContact(int index) {
    final deleted = state;
    deleted.removeAt(index);
    state = List.from(deleted);
  }
    void editContact(int? index, ContactModel contact) {
    if (index != null) {
      final update = [...state];
      update[index] = contact;
      state = update;
    } else {
      state = [...state, contact];
    }
  }
}

final ContactProvider = NotifierProvider<ContactNotifier, List<ContactModel>>(
    () => ContactNotifier());

final imageProvider = StateProvider<XFile?>((ref) => null);


