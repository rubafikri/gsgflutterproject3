import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:flutter_application_2/home/services/imagenamea.dart';
import 'package:flutter_application_2/widget/headerPages.dart';

import 'cartScreenWidget.dart';

class CustomListItem extends StatefulWidget {
  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderPagesWidget('Cart'),
          CartWidget(),
          CartWidget(),
          CartWidget(),
          CartWidget(),
          CartWidget(),
          CartWidget(),
        ],
      ),
    );
  }
}
