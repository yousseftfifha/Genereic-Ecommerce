import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:shop_app/models/OrderCustomer.dart';
import 'PdfApi.dart';

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}

class PdfInvoiceApi {
  static Future<File> generate(OrderCustomer order) async {
    final pdf = Document();
    final ByteData bytes = await rootBundle.load('assets/images/logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(MultiPage(
      build: (context) => [
        pw.Image(
            pw.MemoryImage(
              byteList,
            ),
            fit: pw.BoxFit.fitHeight),
        buildHeader(order),
        SizedBox(height: 1.5 * PdfPageFormat.cm),
        buildTitle(order),
        buildInvoice(order),
        Divider(),
        buildTotal(order),
      ],
      footer: (context) => buildFooter(order),
    ));

    return PdfApi.saveDocument(
        name: "Order N°:" +
            order.orderNumber +
            "  " +
            order.user.username +
            '.pdf',
        pdf: pdf);
  }

  static Widget buildHeader(OrderCustomer order) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: "Order N°" +
                      order.orderNumber+
                      "\n relative to User  " +
                      order.user.username +
                      "\n Order Date:  " +
                      order.orderCustomerItems[0].createdDate.toIso8601String(),
                ),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInvoiceInfo(order),
            ],
          ),
        ],
      );

  static Widget buildInvoiceInfo(OrderCustomer info) {
    final titles = <String>['Invoice Number:', 'Invoice Date:', 'To:\n'];
    final data = <String>[
      info.orderNumber,
      Utils.formatDate(info.orderCustomerItems[0].createdDate),
      info.user.customer.addressList[0].country +
          " " +
          info.user.customer.addressList[0].state +
          " " +
          info.user.customer.addressList[0].city +
          " " +
          info.user.customer.addressList[0].street +
          " " +
          info.user.customer.addressList[0].zipcode
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildTitle(OrderCustomer invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INVOICE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.user.email),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildInvoice(OrderCustomer invoice) {
    final headers = ['Description', 'Date', 'Quantity', 'Unit Price', 'Total'];
    final data = invoice.orderCustomerItems.map((item) {
      final total = item.product.price * item.quantity;

      return [
        item.product.name,
        Utils.formatDate(item.createdDate),
        '${item.quantity}',
        item.product.price.toStringAsFixed(2) + '  \TND',
        '${total.toStringAsFixed(2)}  \TND ',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(OrderCustomer invoice) {
    final netTotal = invoice.orderCustomerItems
        .map((item) => item.product.price * item.quantity)
        .reduce((item1, item2) => item1 + item2);

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: Utils.formatPrice(netTotal),
                  unite: true,
                ),
                Divider(),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(OrderCustomer invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Payment', value: 'on Hand'),
        ],
      );

  static buildSimpleText({
    String title,
    String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 1 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    String title,
    String value,
    double width = double.infinity,
    TextStyle titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
