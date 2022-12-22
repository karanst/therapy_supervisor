import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:intl/intl.dart';
import 'package:therapy/view/buttons/appButton.dart';

class AddVisitHistory extends StatefulWidget {
  const AddVisitHistory({Key? key}) : super(key: key);

  @override
  State<AddVisitHistory> createState() => _AddVisitHistoryState();
}

class _AddVisitHistoryState extends State<AddVisitHistory> {

  var items = [
    'Non face to face service',
    'Direct Service',
    'Short Notice Cancellation',
    'Provide Travel',
    'Report Writing(NDIA required)',
    'Telehealth'

    '',
  ];
  String? dropdownValue;

  String _dateValue = '';
  var dateFormate;
  String? sDate;

  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController futureController = TextEditingController();

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        //firstDate: DateTime.now().subtract(Duration(days: 1)),
        // lastDate: new DateTime(2022),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: Colors.black, //Head background
                accentColor: Colors.black,
                colorScheme:
                ColorScheme.light(primary:  colors.primary),
                buttonTheme:
                ButtonThemeData(textTheme: ButtonTextTheme.primary)),
            child: child!,
          );
        });
    if (picked != null)
      setState(() {
        String yourDate = picked.toString();
        _dateValue = convertDateTimeDisplay(yourDate);
        print(_dateValue);
        dateFormate =
            DateFormat("dd/MM/yyyy").format(DateTime.parse(_dateValue ?? ""));
        sDate =
            DateFormat("yyyy-MM-dd").format(DateTime.parse(_dateValue ?? ""));
        dateController.text = dateFormate;
      });
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  TimeOfDay? selectedTime;

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        useRootNavigator: true,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(primary: colors.primary),
                buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(primary: colors.primary))),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!),
          );
        });
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay.replacing(hour: timeOfDay.hourOfPeriod);
        timeController.text = selectedTime!.format(context);
      });
    }
    var per = selectedTime!.period.toString().split(".");
    print(
        "selected time here ${selectedTime!.format(context).toString()} and ${per[1]}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Visit History", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:

          _visitFields()
        ),
      ),
    );
  }

  Widget _visitFields(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.only(left: 5.0),
          child: Text(
            "Number of Hours",
            style: TextStyle(fontSize: 15, color: colors.fntClr),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width-40,
            child: TextFormField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v!.isEmpty) {
                  return "Enter Number of hours";
                }
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.hourglass_bottom),
                // suffix: const Icon(Icons.hourglass_top_outlined),
                  // hintText: "Number of hours",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                          color: colors.fntClr.withOpacity(0.5)))),
            ),
          ),
        ),

        const Padding(
          padding:  EdgeInsets.only(left: 5.0),
          child: Text(
            "Therapy Date",
            style: TextStyle(fontSize: 15, color: colors.fntClr),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: InkWell(
              onTap: () {
                _selectDate();
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: colors.fntClr.withOpacity(0.5))),
                child: _dateValue.isNotEmpty
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                  "$dateFormate",
                  style: const TextStyle(
                          color: colors.fntClr, fontSize: 15),
                ),
                        const Icon(Icons.calendar_month,
                            color: colors.subTxtClr)
                      ],
                    )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                  "",
                  style: TextStyle(
                          color: colors.fntClr.withOpacity(0.5),
                          fontSize: 15),
                ),
                       const Icon(Icons.calendar_month,
                        color: colors.subTxtClr,)
                      ],
                    ),
              )
            // TextFormField( controller: dateController,
            //   validator: (v){
            //     if(v!.isEmpty){
            //       return "Enter date";
            //     }
            //   },
            //   readOnly: true,
            //   decoration: InputDecoration(
            //       hintText: "Select Date",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(7),
            //           borderSide: BorderSide(color: appColorBlack.withOpacity(0.5))
            //       )
            //   ),),
          ),
        ),

        const Padding(
          padding:  EdgeInsets.only(left: 5.0),
          child: Text(
            "Therapy Time",
            style: TextStyle(fontSize: 15, color: colors.fntClr),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: colors.fntClr.withOpacity(0.5))),
                  child:
                  selectedTime != null
                      ?
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${selectedTime!.format(context)}"),
                       const   Icon(Icons.access_time,
                         color: colors.subTxtClr,)
                        ],
                      )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                    "",
                    style: TextStyle(
                            color: colors.fntClr.withOpacity(0.5),
                            fontSize: 15),
                  ),
                          const   Icon(Icons.access_time,
                          color: colors.subTxtClr,)
                        ],
                      )),
            // TextFormField( controller: locationController,
            //   validator: (v){
            //     if(v!.isEmpty){
            //       return "Enter time";
            //     }
            //   },
            //   readOnly: true,
            //   decoration: InputDecoration(
            //       hintText: "Select time",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(7),
            //           borderSide: BorderSide(color: appColorBlack.withOpacity(0.5))
            //       )
            //   ),),
          ),
        ),

        const Padding(
          padding:  EdgeInsets.only(left: 5.0),
          child: Text(
            "Notes",
            style: TextStyle(fontSize: 15, color: colors.fntClr),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(

                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                elevation: 16,
                style: const TextStyle(color: Colors.black54),
                underline: Container(
                  // height: 2,
                  color: Colors.black54,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: items
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        const Padding(
          padding:  EdgeInsets.only(left: 5.0),
          child: Text(
            "Purpose of the Session",
            style: TextStyle(fontSize: 15, color: colors.fntClr),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width-40,
            child: TextFormField(
              maxLines: 4,
              controller: purposeController,
              // keyboardType: TextInputType.number,
              validator: (v) {
                if (v!.isEmpty) {
                  return "This is field is required!";
                }
              },
              decoration: InputDecoration(
                  // suffix: const Icon(Icons.hourglass_top_outlined),
                  // hintText: "Number of hours",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                          color: colors.fntClr.withOpacity(0.5)))),
            ),
          ),
        ),

        const Padding(
          padding:  EdgeInsets.only(left: 5.0),
          child: Text(
            "Plan for future sessions",
            style: TextStyle(fontSize: 15, color: colors.fntClr),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width-40,
            child: TextFormField(
              maxLines: 4,
              controller: futureController,
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v!.isEmpty) {
                  return "This is field is required!";
                }
              },
              decoration: InputDecoration(
                  // suffix: const Icon(Icons.hourglass_top_outlined),
                  // hintText: "Plan for future sessions",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                          color: colors.fntClr.withOpacity(0.5)))),
            ),
          ),
        ),
        AppBtn(
          onPress: (){},
          title: "Add",
          height: 45,
          fSize: 16,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
