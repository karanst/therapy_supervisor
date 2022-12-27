import 'dart:io';

import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/buttons/custom_button.dart';
import 'package:therapy/view/profile/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController fullNameController  = TextEditingController();

  _profileHeader(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
                clipper: SkewCut(),
                child:
                Container(
                  height: MediaQuery.of(context).size.height/3.0,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/profile_placeholder.png"
                          ),
                          fit: BoxFit.fill
                      ),
                      color: Theme.of(context).colorScheme.secColor.withOpacity(0.7)
                  ),
                  // child: Image.asset("assets"),
                )
            ),



            Positioned(
              top: Platform.isAndroid ? 125 : 150,
              // left: 120,
              child: Center(
                child: CircleAvatar(
                  radius: 65,
                  child: Image.asset("assets/images/profile.png"),
                ),
              ),
            ),
            Positioned(
              top: Platform.isAndroid ? 130 : 150,
              // left: 120,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 65,
                  child: Image.asset("assets/icons/camera.png"),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            _profileHeader(),
             Text("Kevin Rock",style: TextStyle(color: Theme.of(context).colorScheme.fontColor,
                /*color:colors.fntClr,*/
                fontSize: 24,
                fontWeight: FontWeight.w600
            ),),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     subTitleText("Level-3", context, 13),
            //     Image.asset('assets/icons/level.png', height: 20,)
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
            //   child: Card(
            //     elevation: 5,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)
            //     ),
            //     child: Container(
            //         padding: const EdgeInsets.all(10),
            //         height: 80,
            //         width: MediaQuery.of(context).size.width,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 const  Text("Hourly Rate",
            //                   style:  TextStyle(
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 14
            //                   ),),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Image.asset('assets/icons/hourlyrate.png', height: 20,),
            //                     subTitleText(" \$10", context, 13),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             const Padding(
            //               padding:  EdgeInsets.symmetric(vertical: 5.0),
            //               child:  VerticalDivider(
            //                 thickness: 2,
            //               ),
            //             ),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 const  Text("AHPRA",
            //                   style:  TextStyle(
            //                       fontWeight: FontWeight.w600,
            //                       fontSize: 14
            //                   ),),
            //                 subTitleText("#MED0001356", context, 13)
            //               ],
            //             ),
            //
            //           ],
            //         )
            //     ),
            //   ),
            // ),
            SizedBox(height: 15,),
            textField(context, fullNameController, "Full Name", 50),
            textField(context, phoneController, "Phone Number", 50),
            textField(context, emailController, "Email Address", 50),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Padding(
            //       padding:  EdgeInsets.only(left: 5.0),
            //       child: Text(
            //         "About me",
            //         style: TextStyle(fontSize: 15, color: colors.fntClr, fontWeight: FontWeight.w500),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(top: 5.0, bottom: 10),
            //       child: Container(
            //         height: 100,
            //         width: MediaQuery.of(context).size.width-40,
            //         child: TextFormField(
            //           maxLines: 4,
            //           controller: aboutController,
            //           // keyboardType: TextInputType.number,
            //           validator: (v) {
            //             if (v!.isEmpty) {
            //               return "This is field is required!";
            //             }
            //           },
            //           decoration: InputDecoration(
            //             // suffix: const Icon(Icons.hourglass_top_outlined),
            //             // hintText: "Number of hours",
            //               border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(7),
            //                   borderSide: BorderSide(
            //                       color: colors.fntClr.withOpacity(0.5)))),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 40, right: 40, bottom: 20),
              child: AppBtn(
                title: "Submit",
                // icon: Icons.edit,
                onPress: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  //     BottomBar()));
                },
                height: 45,
                width: MediaQuery.of(context).size.width-30,
                fSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40),
              child: CustomAppBtn(
                title: "Back",
                // icon: Icons.edit,
                onPress: (){
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  //     BottomBar()));
                },
                height: 45,
                width: MediaQuery.of(context).size.width-30,
                fSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
