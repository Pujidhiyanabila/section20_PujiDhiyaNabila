import 'package:flutter/material.dart';
import 'package:flutter_20/home_page.dart';
import 'package:flutter_20/model.dart';
import 'stores/contact.dart' as contact_store;
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({ Key? key }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContact();
}

class _AddContact extends State<AddContact> {

  String name = '';
  String phoneNumber = '';
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Book App'),
      ),
      body: Form(
        key: formKey, 
        child: Column(
          children: [
            TextField(
              controller: nameController,
              onChanged: (String value) {
                name = value;
              },
            ),
            TextField(
              controller: phoneNumberController,
              onChanged: (String value) {
                phoneNumber = value;
              },
            ),
            ElevatedButton(
              onPressed: (){
                if (!formKey.currentState!.validate()) return;

                formKey.currentState!.save();

                contactProvider.add(
                  GetContact(
                    name: name, 
                    phoneNumber: phoneNumber,
                  ),
                );
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => HomePage())
                );
              }, 
              child: const Text('Add Number'),
            ),
          ],
        ),
      ),
    );
  }
}