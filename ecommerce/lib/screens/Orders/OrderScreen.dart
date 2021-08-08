import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/models/OrderCustomer.dart';
import 'package:shop_app/screens/Orders/OrderItemsScreen.dart';
import 'package:shop_app/services/OrderService.dart';
import 'package:shop_app/services/PdfApi.dart';
import 'package:shop_app/services/PdfInvoiceApi.dart';

import '../../enums.dart';

class OrderScreen extends StatefulWidget {
  static String routeName = "/OrderScreen";
  final int id;

  const OrderScreen({Key key, @required this.id}) : super(key: key);
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
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder(
        future: _func,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List<OrderCustomer> data = snapshot.data;
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
                                'Order ID',
                              ),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                              ),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Text(
                                'Username',
                              ),
                              numeric: false,
                              tooltip: "Username",
                            ),
                            DataColumn(
                              label: Text(
                                'FirstName',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "FirstName",
                            ),
                            DataColumn(
                              label: Text(
                                'LastName',
                              ),
                              numeric: false,
                              tooltip: "LastName",
                            ),
                            DataColumn(
                              label: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "Email",
                            ),
                            DataColumn(
                              label: Text(
                                'Cellphone',
                              ),
                              numeric: true,
                              tooltip: "Cellphone",
                            ),
                            DataColumn(
                              label: Text(
                                'ACTION',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "ACTION",
                            ),
                            DataColumn(
                              label: Text(
                                'Invoice',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 16.0,
                                ),
                              ),
                              numeric: false,
                              tooltip: "Invoice",
                            )
                          ],
                          rows: data
                              .map(
                                (order) => DataRow(
                                  cells: [
                                    DataCell(
                                      Container(
                                        width: 100,
                                        child: Text(
                                          order.orderNumber,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Container(
                                        width: 100,
                                        child: Text(
                                          order.status,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          order.user.username.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    DataCell(
                                      Center(
                                        child: Text(
                                          order.user.email.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text(
                                          order.user.customer.phoneNumber
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              OrderItemScreen.routeName,
                                              arguments: OrderItemArguments(
                                                  id: order.id),
                                            );
                                          },
                                          child: Text(
                                            "Show Details",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: FlatButton(
                                          onPressed: () async {
                                            final pdfFile =
                                                await PdfInvoiceApi.generate(
                                                    order);

                                            PdfApi.openFile(pdfFile);
                                          },
                                          child: Text(
                                            "Genrate Invoice",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
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
