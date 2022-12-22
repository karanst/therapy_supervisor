import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/profile/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _profileHeader(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
            clipper: SkewCut(),
        child:
            Container(
              height: MediaQuery.of(context).size.height/3.4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secColor.withOpacity(0.7)
              ),
              // child: Image.asset("assets"),
            )
            ),

            Positioned(
              top: 120,
              // left: 120,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Image.asset("assets/images/profile_placeholder.png"),
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
            Text("Kevin Rock",style: TextStyle(
              color:Theme.of(context).colorScheme.fontColor,
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
            //       padding: const EdgeInsets.all(10),
            //       height: 80,
            //       width: MediaQuery.of(context).size.width,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //             const  Text("Hourly Rate",
            //                 style:  TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 14
            //                 ),),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Image.asset('assets/icons/hourlyrate.png', height: 20,),
            //                   subTitleText(" \$10", context, 13),
            //                 ],
            //               ),
            //             ],
            //           ),
            //          const Padding(
            //             padding:  EdgeInsets.symmetric(vertical: 5.0),
            //             child:  VerticalDivider(
            //               thickness: 2,
            //             ),
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               const  Text("AHPRA",
            //                 style:  TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 14
            //                 ),),
            //              subTitleText("#MED0001356", context, 13)
            //             ],
            //           ),
            //
            //         ],
            //       )
            //     ),
            //   ),
            // ),
            // profileCard(context, 80, "No of Coins", "120", "assets/icons/coins.png"),
            // profileCard(context, 80, "No of Stars", "(2/20)",  "assets/icons/stars.png"),
            //
            profileCard(context, 80, "Phone Number", "+61987654321",  "assets/icons/telephone.png"),
            profileCard(context, 80, "Email Address", "dummy12@gmail.com",  "assets/icons/mail.png"),
            // profileCard(context, 120, "About Me", "Lorem ipsum is placeholder text commonly"
            //     " used in the graphic, print, and publishing "
            //     "industries for previewing layouts and visual mockups",  "assets/icons/about.png"),

            Padding(
              padding: const EdgeInsets.all(40.0),
              child: AppBtn(
                title: "Edit Profile",
                icon: Icons.edit,
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const EditProfile()));
                },
                height: 50,
                width: MediaQuery.of(context).size.width-30,
                fSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkewCut extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width , size.height- 60);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCut oldClipper) => false;
}