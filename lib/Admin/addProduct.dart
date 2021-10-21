import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/helpers/firstoreHelper.dart';
import 'package:flutter_application_2/Admin/provider/adminProvider.dart';
import 'package:flutter_application_2/Auth/helpers/firestorage_helper.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static String routeName = 'add';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool valuefirst = false;
  bool valuesecond = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController proName = new TextEditingController();

  TextEditingController proPrice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.8), width: 2.0),
                      onPressed: () async {
                        provider.selectFile();
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(14, 40, 14, 40),
                          child: provider.file == null
                              ? Icon(Icons.person_add)
                              : Container(
                                  width: 190.0,
                                  height: 190.0,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(provider.file))))),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.8), width: 2.0),
                      onPressed: () {
                        provider.selectFile2();
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(14, 40, 14, 40),
                          child: provider.file2 == null
                              ? Icon(Icons.person_add)
                              : Container(
                                  width: 190.0,
                                  height: 190.0,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(provider.file2))))),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.8), width: 2.0),
                      onPressed: () {
                        provider.selectFile3();
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(14, 40, 14, 40),
                          child: provider.file33 == null
                              ? Icon(Icons.person_add)
                              : Container(
                                  width: 190.0,
                                  height: 190.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(provider.file33))))),
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enter Product Name',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: provider.nameController,
                  decoration: InputDecoration(hintText: 'Product Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You should add product name';
                    } else if (value.length > 10) {
                      return 'product name must be less than 10';
                    }
                    return value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: provider.priceController,
                  decoration: InputDecoration(hintText: 'Product Price'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You should add product name';
                    }
                    return value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: provider.descriptionController,
                  decoration: InputDecoration(hintText: 'descripton'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You should add product name';
                    }
                    return value;
                  },
                ),
              ),
              CheckboxListTile(
                secondary: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                title: const Text('isFeatured'),
                value: provider.isFeatured,
                onChanged: (bool value) {
                  setState(() {
                    provider.isFeatured = value;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                title: const Text('isPopular'),
                value: provider.isPopular,
                onChanged: (bool value) {
                  setState(() {
                    provider.isPopular = value;
                  });
                },
              ),
              FlatButton(
                  onPressed: () {
                    provider.addPro();
                  },
                  child: Text('add'))
            ],
          ),
        ),
      );
    });
  }
}
