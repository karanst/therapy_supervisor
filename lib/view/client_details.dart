import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/schedule/add_schedule.dart';
import 'package:therapy/view/schedule/view_schedule.dart';
import 'package:therapy/view/visits/add_visit_history.dart';

class ClientDetails extends StatefulWidget {
  const ClientDetails({Key? key}) : super(key: key);

  @override
  State<ClientDetails> createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primary,
      appBar: customAppBar("Client Details", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                      // height: MediaQuery.of(context).size.height - 97.6 - 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: colors.whit,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Client's Name", context, 12),
                                titleText("John Wick", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Age", context, 12),
                                titleText("23", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Date of Birth", context, 12),
                                titleText("08/07/1997", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Contact No.", context, 12),
                                titleText("+91 222233333", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Gender", context, 12),
                                titleText("Male", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText("Location", context, 12),
                                titleText("Canberra, Australia", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleText("Description", context, 12),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .23,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and typesetting industry . Lorem Ipsum Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy and typesetting industry . Lorem Ipsum industry's standard dummy when an unknown printer",
                                      maxLines: 6,
                                      style: TextStyle(
                                          color: colors.subTxtClr,
                                          fontSize: 12,
                                          height: 2),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                bottom: 15
                              ),
                              child: AppBtn(
                                onPress: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddVisitHistory()));
                                },
                                title: "Add Session Details",
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppBtn(
                                    onPress: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddSchedule()));
                                    },
                                    title: "Add Schedule",
                                    width: MediaQuery.of(context).size.width/2.5,
                                    height: 45,
                                  ),
                                  AppBtn(
                                    onPress: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewSchedule()));
                                    },
                                    title: "View Schedule",
                                    width: MediaQuery.of(context).size.width/2.5,
                                    height: 45,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .04,
                  // left: MediaQuery.of(context).size.width * .38,
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      child: CircleAvatar(
                        backgroundColor: colors.secondary1,
                        radius: MediaQuery.of(context).size.width * .2,
                        child:  Text(
                          "JW",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secColor,
                              fontSize: 35,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}

