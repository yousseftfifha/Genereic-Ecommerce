import 'package:flutter/material.dart';
import 'package:shop_app/components/my_header.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/services/OrderService.dart';

class OrderScreen extends StatefulWidget {
  static String routeName = "/OrderScreen";

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final controller = ScrollController();
  double offset = 0;
  Future _func;

  OrderService os = new OrderService();
  @override
  void initState() {
    _func = os.fetchData();
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
    return Scaffold(
      body: FutureBuilder(
        future: _func,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List<Order> data = snapshot.data;
            // print(data);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyHeader(
                    image: "assets/images/splash_2.png",
                    textTop: "All Orders",
                    textBottom: " ",
                    iconleft: true,
                    offset: offset,
                  ),
                  Center(
                    child: Text(
                      'Orders ->',
                    ),
                  ),
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
                                'Order ID',
                              ),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text(
                                'Total Price',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: true,
                              tooltip: "Total Price",
                            ),
                            DataColumn(
                              label: Text(
                                'FirstName',
                              ),
                              numeric: false,
                              tooltip: "FirstName",
                            ),
                            DataColumn(
                              label: Text(
                                'LastName',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "LastName",
                            ),
                          ],
                          rows: data
                              .map(
                                (order) => DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        width: 100,
                                        child: Text(
                                          order.id.toString(),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width: 60.0,
                                        child: Center(
                                          child: Text(
                                            order.totalPrice.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          order.user.customer.firstName
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          order.user.customer.lastName
                                              .toString(),
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
    );
  }
}
