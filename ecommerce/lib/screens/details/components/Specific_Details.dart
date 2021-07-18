import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SpecificDetails extends StatefulWidget {
  const SpecificDetails({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _SpecificDetailsState createState() => _SpecificDetailsState();
}
class _SpecificDetailsState extends State<SpecificDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
