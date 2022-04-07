import 'package:flutter/material.dart';
import 'package:flutter_20/add_contact.dart';
import 'stores/contact.dart' as contact_store;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String phoneNumber = '';
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  Widget buildList(BuildContext context){
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return ListView.builder(
      itemCount: contactProvider.contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(contactProvider.contacts[index].name),
          subtitle: Text(contactProvider.contacts[index].phoneNumber),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Contact"),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search)
          ),
        ],
      ),
      body: buildList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF65A9E0),
        onPressed: () {
          Navigator.of(context)
          .push (MaterialPageRoute(
              builder: (_) => const AddContact()
          ),
          );
        },
      ),
    );
  }
}