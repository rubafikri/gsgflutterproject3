import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/models/Product.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';

class CartWidget extends StatefulWidget {
  // Product product;
  // CartWidget(this.product);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset(
                ImagesName.Cat2Image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Woman t- shirt',
                  style: TextStyle(color: Color(0xff434343), fontSize: 16)),
              Text('Lotto.LTD',
                  style: TextStyle(color: Color(0xff919191), fontSize: 16)),
              Text('\$34.00',
                  style: TextStyle(color: Color(0xff374ABE), fontSize: 16)),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Container(
                  width: 120,
                  height: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 25, left: 12),
                        child: GestureDetector(
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          onTap: minus,
                        ),
                      ),
                      Text('$_n', style: TextStyle(fontSize: 15.0)),
                      Padding(
                        padding: EdgeInsets.only(left: 32, right: 11),
                        child: GestureDetector(
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          onTap: add,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 57),
            height: 140,
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
