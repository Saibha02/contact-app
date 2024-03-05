import 'package:flutter/material.dart';
import 'package:flutter_application_5/model/contact_model.dart';
import 'package:flutter_application_5/provider/contact_provider.dart';
import 'package:flutter_application_5/view/addfun.dart';
import 'package:flutter_application_5/view/addnumber.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Mycontact extends ConsumerWidget {
  Mycontact({super.key});

  final name = TextEditingController();
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    final contacts = ref.watch(ContactProvider);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Text('Contact app'),
            centerTitle: false,
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      value: 'exit',
                      child: TextButton.icon(
                          onPressed: () {
                            showAlert(context);
                          },
                          icon: Icon(Icons.add),
                          label: Text('create new contact')))
                ];
              })
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    tileColor: const Color.fromARGB(166, 173, 182, 178),
                    leading: CircleAvatar(
                      backgroundImage: contacts[index].imageFile == null
                          ? null
                          : FileImage(contacts[index].imageFile!),
                      child: contacts[index].imageFile == null
                          ? Icon(Icons.person)
                          : null,
                    ),
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.call_outlined)),
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                  value: 'gotoMain',
                                  child: TextButton(
                                      onPressed: () {
                                        ref
                                            .read(ContactProvider.notifier)
                                            .removeContact(index);
                                        Navigator.pop(context, 'gotomain');
                                      },
                                      child: Text('Delete'))),
                              PopupMenuItem(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        final controller =
                                            TextEditingController(
                                                text: contacts[index].name);
                                        final numController =
                                            TextEditingController(
                                                text: contacts[index].phone);
                                        return AlertDialog(
                                          title: Text('edit contact'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: controller,
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                              TextField(
                                                controller: numController,
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  ref
                                                      .read(ContactProvider
                                                          .notifier)
                                                      .editContact(
                                                          index,
                                                          ContactModel(
                                                              name: controller
                                                                  .text,
                                                              phone:
                                                                  numController
                                                                      .text));
                                                },
                                                child: Text('save')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('cancel'))
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Edit Contact'))
                            ];
                          },
                        )
                      ],
                    )),
              );
            },
          ),
        ),
        floatingActionButton: keyboardIsOpened
            ? null
            : Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: FloatingActionButton(
                  tooltip: 'add item',
                  backgroundColor: Colors.grey,
                  onPressed: () {
                    ShowNumber(context);
                  },
                  child: const Icon(Icons.dialpad),
                ),
              ));
  }
}
