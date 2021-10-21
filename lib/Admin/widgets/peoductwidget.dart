import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/editPro.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  Function update;
  Function delete;
  ProductWidget(this.product, this.update, this.delete);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return EditProduct(product);
        }));
        update(product);
        print(product.title);
      },
      child: Container(
        width: 252,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1),
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 17),
        margin: EdgeInsets.only(left: 27, right: 22, top: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 17, right: 17),
              child: SizedBox(
                height: 113,
                width: 103,
                child: Image.network(
                  product.image1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style: TextStyle(color: Color(0xff434343), fontSize: 16)),
                Text(product.description,
                    maxLines: 2,
                    style: TextStyle(color: Color(0xff919191), fontSize: 16)),
                Text(product.price,
                    style: TextStyle(color: Color(0xff374ABE), fontSize: 16)),
              ],
            ),
            Container(
              height: 140,
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  delete(product.id);
                  print(product.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
