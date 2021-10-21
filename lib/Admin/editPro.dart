import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/controlPannel.dart';
import 'package:flutter_application_2/Admin/helpers/firstoreHelper.dart';
import 'package:flutter_application_2/home/models/Product.dart';

class EditProduct extends StatefulWidget {
  Product product;
  EditProduct(this.product);
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController shortDesccontroller = TextEditingController();

  TextEditingController ingrdiatecontroller = TextEditingController();

  TextEditingController prprationcontroller = TextEditingController();

  TextEditingController idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.product.title,
              onChanged: (value) {
                widget.product.title = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.product.description,
              onChanged: (value) {
                widget.product.description = value;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextFormField(
              maxLines: 5,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
              ),
              initialValue: widget.product.price,
              onChanged: (value) {
                widget.product.price = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text('EDIT '),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              ),
              onPressed: () async {
                print(widget.product.toMap());
                await FirestoreHelperProduct.firestoreHelper.editProduct(
                    Product(
                        title: widget.product.title,
                        price: this.widget.product.price,
                        description: this.widget.product.description,
                        image1: this.widget.product.image1,
                        image2: this.widget.product.image2,
                        image3: this.widget.product.image3,
                        id: this.widget.product.id),
                    widget.product.id);

                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return ControlPannelScreen();
                }));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
