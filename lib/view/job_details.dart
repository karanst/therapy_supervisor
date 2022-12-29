import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/notes/view_notes.dart';
import 'package:therapy/view/profile_details.dart';

class JobDetails extends StatelessWidget {
  final model;
  final  i;
  final bool? isClient;
   JobDetails({Key? key, this.model, this.i, this.isClient}) : super(key: key);


  List<Map<String, dynamic>> jobs = [
    {"time": "9am to 1pm", "day": "Mon", "hours": "4 hrs", "date": "08 July 2022"},
    {"time": "9am to 1pm", "day": "Tue", "hours": "6 hrs", "date": "09 July 2022"},
  ];

  List<Map<String,dynamic>> assignDrList = [
    {"image": "assets/images/people1.png", "name": "Dr. Maureen Desburg", "profile": "Sr. Therapist",},
    // {"image": "assets/images/profile3.png", "name": "Dr. Moron George", "profile": "Sr. Therapist"},
    // {"image": "assets/images/profile2.png", "name": "Dr. Besto Decock", "profile": "Sr. Therapist"},
    // {"image": "assets/images/profile3.png", "name": "Dr. Besto Decock", "profile": "Sr. Therapist"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Job Details", context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/people1.png'
                          )
                      )
                  ),
                ),
              Padding(
                 padding: const EdgeInsets.only(top: 8.0),
                 child:  Text("John Wick",
                    style:  TextStyle(color:Theme.of(context).colorScheme.fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
               ),
                Container(
                  height: 32,
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileDetails(
                          isClient: isClient
                        )));
                      },
                      child:
                       Text("View Profile", style:
                      TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secColor,
                      ),)),
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     subTitleText("Total Days", context, 14),
                      Text("15",
                     style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
                       fontWeight: FontWeight.w600
                     ),)
                   ],
                 ),
               const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText("Total Hours", context, 14),
                     Text("100 hours",
                      style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
                          fontWeight: FontWeight.w600
                      ),)
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                child: secTitleText("Assigned Dr.", context, 18),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: assignDrList.length,
                    itemBuilder: (context, index){
                  return assignedCard(context, assignDrList, index);
                }),
                const SizedBox(height: 10,),
                isClient == true ?
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: jobs.length,
                    itemBuilder: (context, index){
                      return jobDetailsCard(context, jobs, index,
                            (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotes(isAdd: isClient,)));
                        }, false);
                    })
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
