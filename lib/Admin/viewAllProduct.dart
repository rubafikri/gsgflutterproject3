import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/helpers/firstoreHelper.dart';
import 'package:flutter_application_2/Admin/provider/adminProvider.dart';
import 'package:flutter_application_2/Admin/widgets/peoductwidget.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:provider/provider.dart';

class ViewAllProductsScreen extends StatefulWidget {
  static final routeName = 'viewPro';

  @override
  State<ViewAllProductsScreen> createState() => _ViewAllProductsScreenState();
}

class _ViewAllProductsScreenState extends State<ViewAllProductsScreen> {
  List<Product> products;

  updatePro(Product product) async {
    await FirestoreHelperProduct.firestoreHelper
        .editProduct(product, product.id);
    getAllPros();
  }

  removePro(String id) async {
    await FirestoreHelperProduct.firestoreHelper.deleteHerb(id);
    getAllPros();
  }

  getAllPros() async {
    products = await FirestoreHelperProduct.firestoreHelper
        .getAllProductsFromFirestore();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: (products == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ProductWidget(products[index], updatePro, removePro);
              },
              itemCount: products.length,
            ),
    );
  }
}
