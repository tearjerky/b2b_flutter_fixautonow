import 'package:b2b_flutter_fixautonow/model/Book_AddOn.dart';
import 'package:b2b_flutter_fixautonow/model/Book_WorkType.dart';
import 'package:b2b_flutter_fixautonow/screens/company/screens/search/CompanyInvoiceSelectAddOnsListScreen.dart';
import 'package:b2b_flutter_fixautonow/viewmodel/company/Company_AddOnListViewModel.dart';
import 'package:b2b_flutter_fixautonow/viewmodel/company/Company_BookInformationViewModelListener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:b2b_flutter_fixautonow/screens/company/screens/search/CompanyInvoiceWorkTypesListScreen.dart';
class CompanyUpdateInvoiceBookingScreen extends StatefulWidget {
  CompanyUpdateInvoiceBookingScreen({this.book_id});

  String book_id;

  @override
  _CompanyUpdateInvoiceBookingScreenState createState() =>
      _CompanyUpdateInvoiceBookingScreenState();
}

class _CompanyUpdateInvoiceBookingScreenState
    extends State<CompanyUpdateInvoiceBookingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<Company_BookInformationViewModelListener>(context,listen: false).fetchBookingInvoiceInformation(widget.book_id);
    Provider.of<Company_AddOnListViewModel>(context,listen: false).fetchAddOnList();
/*
    Provider.of<Book_ViewModelListener>(context, listen: false)
        .fetchInvoiceInformation_Update(widget.book_id);
    Provider.of<Company_AddOnListViewModel>(context, listen: false)
        .fetchAddOnList();*/
  }

  @override
  Widget build(BuildContext context) {
   /* var bookViewModel = Provider.of<Book_ViewModelListener>(context);
    var addOnModel = Provider.of<Company_AddOnListViewModel>(context);
*/


    var bookListener = Provider.of<Company_BookInformationViewModelListener>(context);
    Widget widget;

    widget = ListView(
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      children: [
        RichText(
          text: TextSpan(
            text: 'Date : ',
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: 'bold', style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Bill To: ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.companyNameTo(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Address : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.address,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Phone : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.contact,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Email : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.email,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Divider(),
        RichText(
          text: TextSpan(
            text: 'Bill From : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text:
                  bookListener.fetchInvoiceInformation.data.companyNameFrom(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Address : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.seller_address,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Phone : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.seller_contact,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Email : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.seller_email,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Divider(),
        Text(
          "Car Details",
          style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        RichText(
          text: TextSpan(
            text: 'Model : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.model,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Plate : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.plate_number,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Text(
          "Service Details",
          style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        RichText(
          text: TextSpan(
            text: 'Name : ',
            style: TextStyle(color: Colors.black54),
            children: <TextSpan>[
              TextSpan(
                  text: bookListener.fetchInvoiceInformation.data.invoice_information.service_name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Divider(),
        Row(children: [
          Text(
            "Type of Service List",
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(),
          ),
          ElevatedButton(
              onPressed: () {
                showCompanyWorkTypeList();
              },
              child: Text("Add Service Item"))
        ]),
        Divider(),
        bookListener.fetchInvoiceInformation.data.invoice_information.bookWorkTypes
            .length ==
            0
            ? Text("No Data Available")
            : Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text("# Item",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Item",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Text("Control")
              ],
            ),
            Divider(),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: bookListener.fetchInvoiceInformation.data.invoice_information.bookWorkTypes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Book_WorkType workType = bookListener.fetchInvoiceInformation.data.invoice_information.bookWorkTypes[index];
                  return Row(
                    children: [
                      Expanded(child: Text("1")),
                      Expanded(child: Text(workType.name)),
                      Expanded(child: Text(workType.description)),
                      Expanded(child: Text("\$ " + workType.price)),
                      Expanded(child: Text("\$ " + workType.price)),
                      GestureDetector(
                        child: FaIcon(FontAwesomeIcons.trash),
                        onTap: () {
                          bookListener.deleteWorkType(workType.id);
                        },
                      )
                    ],
                  );
                }),
          ],
        ),
        Row(children: [
          Text(
            "Add Ons List",
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(),
          ),
          ElevatedButton(
              onPressed: () {
                showCompanyAddOnList();
              },
              child: Text("Add Item"))
        ]),
        bookListener.fetchInvoiceInformation.data.invoice_information.bookAddOns
            .length ==
            0
            ? Text("No Data Available")
            : Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text("# Item",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Item",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Expanded(
                    child: Text("Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                Text("Control")
              ],
            ),
            Divider(),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: bookListener.fetchInvoiceInformation.data.invoice_information.bookAddOns.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Book_AddOn addOn = bookListener.fetchInvoiceInformation.data.invoice_information.bookAddOns[index];
                  return Row(
                    children: [
                      Expanded(child: Text(addOn.count)),
                      Expanded(child: Text(addOn.name)),
                      Expanded(child: Text(addOn.description)),
                      Expanded(
                          child: Text(
                              "\$ " + addOn.price.toString() ?? "0")),
                      Expanded(
                          child: Text(
                              "\$ " + addOn.total.toString() ?? "0")),
                      GestureDetector(
                        child: FaIcon(FontAwesomeIcons.trash),
                        onTap: () {
                          bookListener.deleteAddOn(addOn.addon_id);
                        },
                      )
                    ],
                  );
                }),
          ],
        ),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {}, child: Text("Update Invoice")))
      ],
    );

  /*  if (addOnModel.status == Status.COMPLETED &&
        bookViewModel.status_showinvoice == Status.COMPLETED) {
      widget = ListView(
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        children: [
          RichText(
            text: TextSpan(
              text: 'Date : ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: 'bold', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Bill To: ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel.book_viewModel_invoice.companyNameTo(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Address : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel
                        .book_viewModel_invoice.invoice_information.address,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Phone : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel
                        .book_viewModel_invoice.invoice_information.contact,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Email : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel
                        .book_viewModel_invoice.invoice_information.email,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(),
          RichText(
            text: TextSpan(
              text: 'Bill From : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text:
                        bookViewModel.book_viewModel_invoice.companyNameFrom(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Address : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel.book_viewModel_invoice
                        .invoice_information.seller_address,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Phone : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel.book_viewModel_invoice
                        .invoice_information.seller_contact,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Email : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel.book_viewModel_invoice
                        .invoice_information.seller_email,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(),
          Text(
            "Car Details",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          RichText(
            text: TextSpan(
              text: 'Model : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel
                        .book_viewModel_invoice.invoice_information.model,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Plate : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel.book_viewModel_invoice
                        .invoice_information.plate_number,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(
            "Service Details",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          RichText(
            text: TextSpan(
              text: 'Name : ',
              style: TextStyle(color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                    text: bookViewModel.book_viewModel_invoice
                        .invoice_information.service_name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(),
          Row(children: [
            Text(
              "Type of Service List",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(),
            ),
            ElevatedButton(
                onPressed: () {
                  showCompanyWorkTypeList();
                },
                child: Text("Add Service Item"))
          ]),
          Divider(),
          bookViewModel.book_viewModel_invoice.invoice_information.bookWorkTypes
                      .length ==
                  0
              ? Text("No Data Available")
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text("# Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Price",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Text("Control")
                      ],
                    ),
                    Divider(),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: bookViewModel.book_viewModel_invoice
                            .invoice_information.bookWorkTypes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Book_WorkType workType = bookViewModel
                              .book_viewModel_invoice
                              .invoice_information
                              .bookWorkTypes[index];
                          return Row(
                            children: [
                              Expanded(child: Text("1")),
                              Expanded(child: Text(workType.name)),
                              Expanded(child: Text(workType.description)),
                              Expanded(child: Text("\$ " + workType.price)),
                              Expanded(child: Text("\$ " + workType.price)),
                              GestureDetector(
                                child: FaIcon(FontAwesomeIcons.trash),
                                onTap: () {
                                  bookViewModel.deleteWorkType(workType.id);
                                },
                              )
                            ],
                          );
                        }),
                  ],
                ),
          Row(children: [
            Text(
              "Add Ons List",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(),
            ),
            ElevatedButton(
                onPressed: () {
                  showCompanyAddOnList();
                },
                child: Text("Add Item"))
          ]),
          bookViewModel.book_viewModel_invoice.invoice_information.bookAddOns
                      .length ==
                  0
              ? Text("No Data Available")
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text("# Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Description",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Price",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Expanded(
                            child: Text("Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54))),
                        Text("Control")
                      ],
                    ),
                    Divider(),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: bookViewModel.book_viewModel_invoice
                            .invoice_information.bookAddOns.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Book_AddOn addOn = bookViewModel
                              .book_viewModel_invoice
                              .invoice_information
                              .bookAddOns[index];
                          return Row(
                            children: [
                              Expanded(child: Text(addOn.count)),
                              Expanded(child: Text(addOn.name)),
                              Expanded(child: Text(addOn.description)),
                              Expanded(
                                  child: Text(
                                      "\$ " + addOn.price.toString() ?? "0")),
                              Expanded(
                                  child: Text(
                                      "\$ " + addOn.total.toString() ?? "0")),
                              GestureDetector(
                                child: FaIcon(FontAwesomeIcons.trash),
                                onTap: () {
                                  bookViewModel.deleteAddOn(addOn.addon_id);
                                },
                              )
                            ],
                          );
                        }),
                  ],
                ),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Update Invoice")))
        ],
      );
    } else {
      widget = Center(
        child: CircularProgressIndicator(),
      );
    }
*/
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Invoice"),
          centerTitle: true,
        ),
        body: widget);
  }

  showCompanyWorkTypeList() {
     Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new CompanyInvoiceWorkTypeList_Screen();
        },
        fullscreenDialog: true));
  }

  showCompanyAddOnList() {
     Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new CompanyInvoiceSelectAddOnsListScreen();
        },
        fullscreenDialog: true));
  }
}
