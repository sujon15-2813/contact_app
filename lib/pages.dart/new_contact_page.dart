//import 'dart:ffi';

//import 'dart:html';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contactapp/utils.dart/helper_functions.dart';
import 'package:image_picker/image_picker.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName = '/new_contact';
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  String? dob;
  XFile? xfile;

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
      "${xfile?.path}"
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          IconButton(
            onPressed: _saveContact,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
          key: formkey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 5,
                        child: xfile == null
                            ? const Icon(
                                Icons.person,
                                size: 70,
                              )
                            : kIsWeb
                                ? Container(
                                    color: Colors.cyanAccent,
                                    child: Image.network(
                                      xfile!.path,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Image.file(
                                    File(xfile!.path),
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          icon: Icon(Icons.camera),
                          onPressed: () async {
                            getImage(ImageSource.camera);
                          },
                          label: const Text('Capture'),
                        ),
                        TextButton.icon(
                          icon: Icon(Icons.photo_album),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          label: const Text('Gallery'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Contact name*',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field must not be empty';
                  }
                  if (value.length > 20) {
                    return 'Name should be less than or equals 20 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _mobileController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Mobile Number*',
                  prefixIcon: Icon(Icons.call),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field must not be empty';
                  }
                  if (double.parse(value) < 11 || double.parse(value) < 14) {
                    return 'Invalid Mobile Number ';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Street Address',
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: _showCalender,
                        label: const Text('Show Date Picker'),
                      ),
                      Text(
                        dob == null ? 'No Date choosen' : dob!,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _saveContact() {
    if (formkey.currentState!.validate()) {}
  }

  void _showCalender() async {
    final dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (dateTime != null) {
      setState(() {
        dob = getFormattedDate(dateTime, 'dd/MM/yyyy');
      });
    }
  }

  Future<void> getImage(ImageSource source) async {
    xfile = await ImagePicker().pickImage(source: source);
    setState(() {});
  }
}
