import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/add_notes.dart';
import 'package:therapy/view/client_details.dart';
import 'package:therapy/view/invoice_Detail.dart';
import 'package:therapy/view/job_details.dart';
import 'package:therapy/view/notes/view_notes.dart';
import 'package:therapy/view/therapist_detail.dart';

Widget availabilityCard(context, model, i) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ClientDetails()));
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shape: const StadiumBorder(),
            child: Container(
              padding: const EdgeInsets.only(left: 85, right: 20),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model[i]['name'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(model[i]['date']),
                    ],
                  ),
                  Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "View",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  // AppBtn(
                  //   title: "View",
                  //   onPress: (){
                  //
                  //   },
                  //   height: 15,
                  //   width: 70,
                  //   fSize: 14,
                  // )
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 40,
            child: Image.asset(model[i]['image']),
          ),
        ],
      ),
    ),
  );
}

Widget leaderCard(context, model, i, rank, coins) {
  return Column(
    children: [
      Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              subTitleText("$rank", context, 14),
              Icon(
                rank == "2"
                    ? Icons.arrow_drop_down_outlined
                    : Icons.arrow_drop_up_outlined,
                color: rank == "2" ? Colors.red : Colors.green,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              radius: 25,
              child: Image.asset(model[i]['image']),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model[i]['name'],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  model[i]['date'],
                  style: const TextStyle(
                      fontSize: 13,
                      color: colors.subTxtClr,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            // alignment: Alignment.centerRight,
            height: 30,
            width: 80,
            decoration: BoxDecoration(
                color: colors.secondary1,
                borderRadius: BorderRadius.circular(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coins,
                  style: const TextStyle(),
                ),
                Image.asset(
                  'assets/images/coin.png',
                  height: 15,
                )
              ],
            ),
          )
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      const Divider(
        height: 10,
        thickness: 1,
      )
    ],
  );

  //   Padding(
  //   padding: const EdgeInsets.only(bottom: 10.0),
  //   child: Stack(
  //     children: [
  //       Card(
  //         elevation: 3,
  //         shape: const StadiumBorder(),
  //         child: Container(
  //           padding: const EdgeInsets.only(left: 85, right: 20),
  //           height: 60,
  //           width: MediaQuery.of(context).size.width,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(50)
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(model[i]['name'],
  //                     style: const TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.bold
  //                     ),),
  //                   Text(model[i]['date']),
  //                 ],
  //               ),
  //               Container(
  //                 height: 25,
  //                 width: 70,
  //                 decoration: BoxDecoration(
  //                     color: colors.primary,
  //                     borderRadius: BorderRadius.circular(30)
  //
  //                 ),
  //                 child: const Center(
  //                   child:  Text("View",
  //                     style: TextStyle(
  //                         color: Colors.white
  //                     ),),
  //                 ),
  //               )
  //               // AppBtn(
  //               //   title: "View",
  //               //   onPress: (){
  //               //
  //               //   },
  //               //   height: 15,
  //               //   width: 70,
  //               //   fSize: 14,
  //               // )
  //             ],
  //           ),
  //         ),
  //       ),
  //       CircleAvatar(
  //         radius: 40,
  //         child: Image.asset(model[i]['image']),
  //       ),
  //     ],
  //   ),
  // );
}

Widget profileCard(context, double height, String label, content, iconImage) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
    child: Container(
     decoration :  BoxDecoration(
          color: Theme.of(context).colorScheme.lightWhite,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                offset: Offset(0.75, 0.75)
            )
          ],
          borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(10),
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconImage,
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style:  TextStyle(color: Theme.of(context).colorScheme.fontColor,
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    content,
                    maxLines: 4,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.fontClr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget supportedCard(context, model, i, bool show, bool isClient) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> JobDetails(isClient : isClient)));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 80,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //     // borderRadius: BorderRadius.circular(50)
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(model[i]['image']))),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model[i]['name'],
                        style:  TextStyle(color: Theme.of(context).colorScheme.fontColor,
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),SizedBox(height: 7,),
                      show ?
                      Text(model[i]['date'],
                        style: TextStyle(color: Theme.of(context).colorScheme.fontClr),)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
              show ?
              Container(
                // alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 30,
                // width: 70,
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    model[i]['status'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
                  : const SizedBox.shrink(),
              // AppBtn(
              //   title: "View",
              //   onPress: (){
              //
              //   },
              //   height: 15,
              //   width: 70,
              //   fSize: 14,
              // )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget jobDetailsCard(context, model, i,  onPress) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.lightWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,
              offset: Offset(0.75, 0.75)
          )
        ],
      ),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                child: Card(
                  color: colors.secondary1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "${model[i]['day']}",
                      style: const TextStyle(
                          color: colors.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Text(
                    "Time",
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.fontColor),
                  ),
                  const SizedBox(height: 8,),
                  subTitleText("${model[i]['time']}", context, 14),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Hours",
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.fontColor),
                  ),
                  const SizedBox(height: 8,),
                  subTitleText("${model[i]['hours']}", context, 14),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.fontColor),
                  ),
                  const SizedBox(height: 8,),
                  subTitleText("${model[i]['date']}", context, 13),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          subTitleText("Description", context, 13),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                    "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content",
                    maxLines: 4,
                    style: TextStyle(color: colors.subTxtClr, fontSize: 13),
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: onPress,
                  child: Row(
                    children:  [
                      // isNote ?
                    Text(
                        "View Notes",
                        style: TextStyle(color: Theme.of(context).colorScheme.secColor,
                            fontWeight: FontWeight.w600),
                      ),
                    // :
                      // Text(
                      //   "Submit Notes",
                      //   style: TextStyle(
                      //       color: Theme.of(context).colorScheme.secColor,
                      //       fontWeight: FontWeight.w600
                      //   ),
                      // ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).colorScheme.secColor,
                        size: 18,
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    ),
  );
}

// Widget jobDetailsCard(context, model, i) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 15.0),
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 60,
//                   width: 60,
//                   child: Card(
//                     color: colors.secondary1,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Center(
//                       child: Text(
//                         "${model[i]['day']}",
//                         style:  TextStyle(
//                             color: Theme.of(context).colorScheme.secColor,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                      Text(
//                       "Time",
//                       style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     subTitleText("${model[i]['time']}", context, 14),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Hours",
//                       style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     subTitleText("${model[i]['hours']}", context, 14),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                      Text(
//                       "Date",
//                       style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     subTitleText("${model[i]['date']}", context, 13),
//                   ],
//                 ),
//               ],
//             ),
//             subTitleText("Description", context, 13),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//                 padding: const EdgeInsets.all(10),
//                 width: MediaQuery.of(context).size.width,
//                 height: 80,
//                 decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Center(
//                     child: Text(
//                   "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content",
//                   maxLines: 4,
//                   style: TextStyle(color: colors.subTxtClr, fontSize: 13),
//                 ))),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewNotes(isAdd: true,)));
//                     },
//                     child: Row(
//                       children:  [
//                         Text(
//                           "View Notes ",
//                           style: TextStyle(color: Theme.of(context).colorScheme.secColor),
//                         ),
//                         Icon(
//                           Icons.arrow_forward_ios_rounded,
//                           color: Theme.of(context).colorScheme.secColor,
//                           size: 18,
//                         )
//                       ],
//                     ))
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

Widget notificationCard(context, model, i) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Image.asset(model[i]['image']),
        ),
        const SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText("${model[i]['name']}", context, 13),
            const SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                "${model[i]['description']}",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.fontClr,
                ),
              )
              // subTitleText("${model[i]['description']}", context, 13)
              ,
            )
          ],
        )
      ],
    ),
  );
}

Widget sessionCard(context, model, i) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     // borderRadius: BorderRadius.circular(50)
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: colors.secondary1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    secTitleText("Session", context, 12),
                    secTitleText(model[i]['session'], context, 12),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleText("Time", context, 14),
                const SizedBox(height: 5,),
                subTitleText(model[i]['time'], context, 14)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleText("Date", context, 14),
                const SizedBox(height: 5,),
                subTitleText(model[i]['date'], context, 14)
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget myMenteesCard(context, model, i) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  JobDetails() ));
    },
    child: Padding(
      padding: const EdgeInsets.only(top : 5, bottom: 10.0),
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shape: const StadiumBorder(),
            child: Container(
              padding: const EdgeInsets.only(left: 85, right: 20),
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model[i]['name'],
                        style:  TextStyle( color: Theme.of(context).colorScheme.fontColor,
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(model[i]['profile'],style: TextStyle(color: Theme.of(context).colorScheme.fontColor /*colors.subTxtClr*/,fontSize: 13 ),),
                            Icon(Icons.star,color: Colors.yellow,size: 16,),
                            Text(model[i]['rating'],style: TextStyle(color: Theme.of(context).colorScheme.fontClr,fontSize: 13),),
                          ],
                        ),
                      )

                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_outlined,color: colors.primary,)
                  // Container(
                  //   height: 25,
                  //   width: 70,
                  //   decoration: BoxDecoration(
                  //       color: colors.primary,
                  //       borderRadius: BorderRadius.circular(30)),
                  //   child: const Center(
                  //     child: Text(
                  //       "View",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // )
                  // AppBtn(
                  //   title: "View",
                  //   onPress: (){
                  //
                  //   },
                  //   height: 15,
                  //   width: 70,
                  //   fSize: 14,
                  // )
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 40,
            child: Image.asset(model[i]['image']),
          ),
        ],
      ),
    ),
  );
}

Widget assignedCard(context, model, i) {
  return Padding(
    padding: const EdgeInsets.only( top: 10),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TherapistDetail()));
       // Navigator.push(context, MaterialPageRoute(builder: (context)=> ClientDetails()));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 80,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //     // borderRadius: BorderRadius.circular(50)
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        image: DecorationImage(
                            image: AssetImage(model[i]['image']))),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.8,
                        child: Text(
                          model[i]['name'],
                          style:  TextStyle(color: Theme.of(context).colorScheme.fontColor,
                              fontSize: 16, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Text(model[i]['profile'],
                          style: TextStyle(color: Theme.of(context).colorScheme.fontClr),

                      ),
                    ],
                  ),
                ],
              ),

              Container(
                // alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "View",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // AppBtn(
              //   title: "View",
              //   onPress: (){
              //
              //   },
              //   height: 15,
              //   width: 70,
              //   fSize: 14,
              // )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget invoiceCard(context, model, i,String status) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  InvoiceDetail(
        status: status
      )));
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 80,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //     // borderRadius: BorderRadius.circular(50)
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        image: DecorationImage(
                            image: AssetImage(model[i]['image']))),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.8,
                        child: Text(
                          model[i]['name'],
                          style:  TextStyle(color: Theme.of(context).colorScheme.fontColor,
                              fontSize: 16, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(model[i]['date'],style: TextStyle(color: Theme.of(context).colorScheme.fontClr,fontWeight: FontWeight.w500,fontSize: 14),),
                    ],
                  ),
                ],
              ),

              Container(
                // alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                    color: model[i]['status'] == "Paid" ? colors.activeColor : model[i]['status'] == "Pending" ? colors.primary : colors.red,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    model[i]['status'],
                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              // AppBtn(
              //   title: "View",
              //   onPress: (){
              //
              //   },
              //   height: 15,
              //   width: 70,
              //   fSize: 14,
              // )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget noteCard(context, model, i){
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
    child: Container(
      width: MediaQuery.of(context).size.width/2,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width/2,
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color:
                        model[i]['color'] == "1"? colors.note1
                            : colors.note2,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        model[i]['initial'],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText("${model[i]['name']}", context, 14),
                      const SizedBox(height: 5,),
                      subTitleText("${model[i]['time']}", context, 12)
                    ],
                  )
                ],
              ),
               const SizedBox(height: 10,),
               Text("Lorem Ipsum is simply dummy text of the Lorem Ipsum is Lorem Ipsum is simply dummy text of",
                maxLines: 3,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.fontColor,
                ),)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget availableCardWidget(context, model, i) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Card(
                    color: colors.secondary1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "${model[i]['day']}",
                        style:  TextStyle(
                            color: Theme.of(context).colorScheme.secColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Time",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subTitleText("${model[i]['time']}", context, 14),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subTitleText("${model[i]['date']}", context, 13),
                  ],
                ),
                Container(
                  height: 35,
                 //padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 105,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:model[i]['status'] == 'Available' ? colors.primary: colors.red,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(model[i]['status'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                ),
              ],
            ),

          ],
        ),
      ),
    ),
  );
}