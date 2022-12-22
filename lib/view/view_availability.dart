import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';

class ViewAvailability extends StatefulWidget {
  const ViewAvailability({Key? key}) : super(key: key);

  @override
  State<ViewAvailability> createState() => _ViewAvailabilityState();
}

class _ViewAvailabilityState extends State<ViewAvailability> {

  int currentIndex = 0;

  List<Map<String, dynamic>> weeklyLIist = [
    {"time": "9am to 1pm", "day": "Mon",  "date": "08 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "Tue",  "date": "09 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "Web",  "date": "09 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "Thu",  "date": "09 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "Fri",  "date": "09 July 2022","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "Sat",  "date": "09 July 2022","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "Sun",  "date": "09 July 2022","status":"Not-Available"},
  ];

  List<Map<String, dynamic>> monthlyLIist = [
    {"time": "9am to 1pm", "day": "1",  "date": "08 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "2",  "date": "09 July 2022","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "3",  "date": "09 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "4",  "date": "09 July 2022","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "5",  "date": "09 July 2022","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "6",  "date": "09 July 2022","status":"Available"},
    {"time": "9am to 1pm", "day": "7",  "date": "09 July 2022","status":"Not-Available"},
  ];

  _weekly(){
    return ListView.builder(
        itemCount: weeklyLIist.length,
        shrinkWrap: true,
        itemBuilder: (context,i){
      return availableCardWidget(context, weeklyLIist, i);
    });
  }

  _monthly(){
    return ListView.builder(
        itemCount: monthlyLIist.length,
        shrinkWrap: true,
        itemBuilder: (context,i){
          return availableCardWidget(context, monthlyLIist, i);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Availability", context),
      body:Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colors.whit),
                      child: const Center(
                        child: TabBar(
                          labelColor: colors.primary,
                          unselectedLabelColor: colors.subTxtClr,
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: colors.primary,
                              fontWeight: FontWeight.w500),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 18.0,
                              color: colors.fntClr,
                              fontWeight: FontWeight.normal),
                          indicator: UnderlineTabIndicator(
                              borderSide: const BorderSide(
                                  width: 2.5,
                                  color: colors.primary)
                          ),
                          // BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //     color: Color(0xFF619aa5)),
                          tabs: <Widget>[
                            Tab(
                              text: 'Weekly',
                            ),
                            Tab(
                              text: 'Monthly',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        _weekly(),
                        _monthly(),
                        // availableWidget(),
                        // notAvailableWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
