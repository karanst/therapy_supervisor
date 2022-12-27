import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {

  int _currentIndex = 0;
  _selectTimePeriod() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: _currentIndex == 0 ? colors.green : Theme.of(context).colorScheme.gray,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Paid",
                  style: TextStyle(
                      color: _currentIndex == 0
                          ? colors.whit
                          : colors.fntClr,
                      //Theme.of(context).colorScheme.lightWhite,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: _currentIndex == 1 ? colors.primary :  Theme.of(context).colorScheme.gray,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Pending",
                  style: TextStyle(
                      color: _currentIndex == 1
                          ? colors.whit
                          : colors.fntClr,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  color: _currentIndex == 2 ? colors.red :  Theme.of(context).colorScheme.gray,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Rejected",
                  style: TextStyle(
                      color: _currentIndex == 2
                          ? colors.whit
                          : colors.fntClr,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> paidList = [
    {"image": "assets/images/people1.png", "name": "Dr. Maureen Desburg", "date":"08 July 2022","status":"Paid"},
    {"image": "assets/images/people2.png", "name": "Dr. Moron George", "date":"08 July 2022","status":"Paid"},
    {"image": "assets/images/people1.png", "name": "Dr. Besto Decock", "date":"22 July 2022","status":"Paid"},
    {"image": "assets/images/people2.png", "name": "Dr. Besto Decock", "date":"25 July 2022","status":"Paid"},
  ];

  List<Map<String, dynamic>> pendingList = [
    {"image": "assets/images/people1.png", "name": "Dr. Maureen Desburg", "date":"08 July 2022","status":"Pending"},
    {"image": "assets/images/people2.png", "name": "Dr. Moron George", "date":"08 July 2022","status":"Pending"},
    {"image": "assets/images/people1.png", "name": "Dr. Besto Decock", "date":"22 July 2022","status":"Pending"},
    {"image": "assets/images/people2.png", "name": "Dr. Besto Decock", "date":"25 July 2022","status":"Pending"},
  ];
  List<Map<String, dynamic>> rejectList = [
    {"image": "assets/images/people1.png", "name": "Dr. Maureen Desburg", "date":"08 July 2022","status":"Rejected"},
    {"image": "assets/images/people2.png", "name": "Dr. Moron George", "date":"08 July 2022","status":"Rejected"},
    {"image": "assets/images/people1.png", "name": "Dr. Besto Decock", "date":"22 July 2022","status":"Rejected"},
    {"image": "assets/images/people2.png", "name": "Dr. Besto Decock", "date":"25 July 2022","status":"Rejected"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: colors.primary,
        title: const  Text("Invoice History",style: TextStyle(color: colors.whiteTemp,fontSize: 18,fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            _selectTimePeriod(),
          _currentIndex == 0 ?  ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: paidList.length,
                itemBuilder: (context, index){
                  return invoiceCard(
                      context, paidList, index,
                    "Paid"
                  );
                }) : _currentIndex == 1 ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pendingList.length,
              itemBuilder: (context, index){
                return invoiceCard(
                    context, pendingList, index,
                  "Pending"
                );
              })  :ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: rejectList.length,
              itemBuilder: (context, index){
                return invoiceCard(
                    context, rejectList, index,
                  "Rejected"
                );
              })
          ],
        ),
      ),
    );
  }
}
