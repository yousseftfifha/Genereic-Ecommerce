import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/models/OrderCustomerItem.dart';

import 'package:shop_app/services/OrderService.dart';
import 'package:shop_app/services/PdfApi.dart';
import 'package:shop_app/services/PdfInvoiceApi.dart';

import '../../enums.dart';
import '../../size_config.dart';

class OrderItemScreen extends StatefulWidget {
  static String routeName = "/OrderItemScreen";
  @override
  _OrderItemScreenState createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  final controller = ScrollController();
  double offset = 0;
  Future _func;

  OrderService os = new OrderService();
  @override
  void initState() {
    /*  final OrderItemArguments agrs = ModalRoute.of(context).settings.arguments;
    _func = os.fetchData1(agrs.order.id);*/
    controller.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final OrderItemArguments agrs = ModalRoute.of(context).settings.arguments;
    _func = os.fetchData1(agrs.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Items'),
      ),
      body: FutureBuilder(
        future: _func,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List<OrderCustomerItem> data = snapshot.data;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: true,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Order Item ID',
                              ),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text(
                                'Product Image',
                              ),
                              numeric: false,
                              tooltip: "Product Image",
                            ),
                            DataColumn(
                              label: Text(
                                'Quantity',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: true,
                              tooltip: "Quantity",
                            ),
                            DataColumn(
                              label: Text(
                                'Product Name',
                              ),
                              numeric: false,
                              tooltip: "Product Name",
                            ),
                            DataColumn(
                              label: Text(
                                'Product Price',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "Product Price",
                            ),
                            DataColumn(
                              label: Text(
                                'Category',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "Category",
                            ),
                          ],
                          rows: data
                              .map(
                                (orderItem) => DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        width: 100,
                                        child: Text(
                                          orderItem.id.toString(),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: SizedBox(
                                          width: 88,
                                          child: AspectRatio(
                                            aspectRatio: 0.88,
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  getProportionateScreenWidth(
                                                      10)),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F6F9),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Image.network(
                                                  '${orderItem.product.productImages[0].url}'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width: 60.0,
                                        child: Center(
                                          child: Text(
                                            orderItem.quantity.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          orderItem.product.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          orderItem.product.price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          orderItem.product.category.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 500),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: Text(
                'An Error Occured!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              content: Text(
                "${snapshot.error}",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
          // By default, show a loading spinner.
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('This may take some time..')
              ],
            ),
          );
        },
      ),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}

class OrderItemArguments {
  final int id;

  OrderItemArguments({@required this.id});
}
