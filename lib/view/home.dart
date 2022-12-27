import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/availability.dart';
import 'package:therapy/view/availability_screen.dart';
import 'package:therapy/view/bottomBar/bottombar.dart';
import 'package:therapy/view/faq_screen.dart';
import 'package:therapy/view/leaderboard.dart';
import 'package:therapy/view/login.dart';
import 'package:therapy/view/notification.dart';
import 'package:therapy/view/people_support.dart';
import 'package:therapy/view/people_supported.dart';
import 'package:therapy/view/privacy_policy.dart';
import 'package:therapy/view/term_condition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> mantees = [
    {"image": "assets/images/profile2.png", "name": "Dr. Maureen Desburg", "profile": "Sr. Therapist","rating":"4.5"},
    {"image": "assets/images/profile3.png", "name": "Dr. Moron George", "profile": "Sr. Therapist","rating":"4.5"},
    {"image": "assets/images/profile2.png", "name": "Dr. Besto Decock", "profile": "Sr. Therapist","rating":"4.5"},
    {"image": "assets/images/profile3.png", "name": "Dr. Besto Decock", "profile": "Sr. Therapist","rating":"4.5"},
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // getDrawer(){
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.all(0),
  //       children: <Widget>[
  //         DrawerHeader(
  //           decoration: BoxDecoration(
  //             color: backgroundblack,
  //           ), //BoxDecoration
  //           child: Row(
  //             children: [
  //               SizedBox(height: 20,),
  //               userPic == null || userPic == "" ? CircleAvatar(
  //                 backgroundColor: appColorWhite,
  //                 radius: 40,
  //                 child: Icon(Icons.person,color: appColorBlack,),
  //               ) : CircleAvatar(
  //                 radius: 40,
  //                 backgroundImage: NetworkImage(userPic),
  //               ),
  //               SizedBox(width: 10,),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "$userName",
  //                       style: TextStyle(fontSize: 18, color: appColorWhite),
  //                     ),
  //                     Text("$userEmail",
  //                       style: TextStyle(color: appColorWhite),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ), //DrawerHeader
  //         ListTile(
  //           leading: const Icon(Icons.home, color: backgroundblack,),
  //           title: const Text(' Home '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => TabbarScreen()),
  //             );
  //           },
  //         ),
  //         // ListTile(
  //         //   leading: const Icon(Icons.chat, color: backgroundblack,),
  //         //   title: const Text(' Chat Support '),
  //         //   onTap: () {
  //         //     Navigator.push(
  //         //       context,
  //         //       // MaterialPageRoute(builder: (context) => ChatPage( chatId: "1", title: "Karan")),
  //         //       MaterialPageRoute(builder: (context)=> ChatScreen()),
  //         //     );
  //         //   },
  //         // ),
  //         // ListTile(
  //         //   leading: const Icon(Icons.settings, color: backgroundblack,),
  //         //   title: const Text('Add Request'),
  //         //   onTap: () {
  //         //     Navigator.push(
  //         //       context,
  //         //       // MaterialPageRoute(builder: (context) => ChatPage( chatId: "1", title: "Karan")),
  //         //       MaterialPageRoute(builder: (context)=> RequestService()),
  //         //     );
  //         //   },
  //         // ),
  //         ListTile(
  //           leading: const Icon(Icons.request_page, color: backgroundblack,),
  //           title: const Text('My Request'),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               // MaterialPageRoute(builder: (context) => ChatPage( chatId: "1", title: "Karan")),
  //               MaterialPageRoute(builder: (context)=> MyRequestPage()),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.privacy_tip_rounded, color: backgroundblack,),
  //           title: const Text(' Privacy Policy '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.list_alt, color: backgroundblack,),
  //           title: const Text(' Terms & Condition '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => TermsConditionScreen()),
  //             );
  //           },
  //         ),
  //         /// Only for Testing
  //         // ListTile(
  //         //   leading: const Icon(Icons.list_alt, color: backgroundblack,),
  //         //   title: const Text(' Testing '),
  //         //   onTap: () {
  //         //     Navigator.push(
  //         //       context,
  //         //       MaterialPageRoute(builder: (context) => HomePage()),
  //         //     );
  //         //   },
  //         // ),
  //         ListTile(
  //           leading: const Icon(Icons.question_answer, color: backgroundblack,),
  //           title: const Text(' FAQ '),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => FaqScreen()),
  //             );
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.logout, color: backgroundblack,),
  //           title: const Text('LogOut'),
  //           onTap: () {
  //             Alert(
  //               context: context,
  //               title: "Log out",
  //               desc: "Are you sure you want to log out?",
  //               style: AlertStyle(
  //                   isCloseButton: false,
  //                   descStyle: TextStyle(fontFamily: "MuliRegular", fontSize: 15),
  //                   titleStyle: TextStyle(fontFamily: "MuliRegular")),
  //               buttons: [
  //                 DialogButton(
  //                   child: Text(
  //                     "OK",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16,
  //                         fontFamily: "MuliRegular"),
  //                   ),
  //                   onPressed: () async {
  //                     setState(() {
  //                       userID = '';
  //
  //                       userEmail = '';
  //                       userMobile = '';
  //                       likedProduct = [];
  //                       likedService = [];
  //                     });
  //                     // signOutGoogle();
  //                     //signOutFacebook();
  //                     preferences!
  //                         .remove(SharedPreferencesKey.LOGGED_IN_USERRDATA)
  //                         .then((_) {
  //                       Navigator.of(context).pushAndRemoveUntil(
  //                         MaterialPageRoute(
  //                           builder: (context) => Login(),
  //                         ),
  //                             (Route<dynamic> route) => false,
  //                       );
  //                     });
  //
  //                     Navigator.of(context, rootNavigator: true).pop();
  //                   },
  //                   color: backgroundblack,
  //                   // color: Color.fromRGBO(0, 179, 134, 1.0),
  //                 ),
  //                 DialogButton(
  //                   child: Text(
  //                     "Cancel",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 16,
  //                         fontFamily: "MuliRegular"),
  //                   ),
  //                   onPressed: () {
  //                     Navigator.of(context, rootNavigator: true).pop();
  //                   },
  //                   color: backgroundblack,
  //                   // gradient: LinearGradient(colors: [
  //                   //   Color.fromRGBO(116, 116, 191, 1.0),
  //                   //   Color.fromRGBO(52, 138, 199, 1.0)
  //                   // ]),
  //                 ),
  //               ],
  //             ).show();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _intro(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset('assets/images/profile1.png'),
          ),
          const SizedBox(width: 10,),
          RichText(
            text: TextSpan(
              text: 'Hi! ',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: colors.primary
              ),
              children:  <TextSpan>[
                TextSpan(text: 'Kevin Rock', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secColor
                ),),

              ],
            ),
          )
        ],
      ),
    );
  }
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  _secondHeader(){
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PeopleSupported()));
          },
          child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25
             // circleRadius / 2.0
              ),
              child:  Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.lightWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0,
                        offset: Offset(0.75, 0.00)
                    )
                  ],
                ),
                height: 120,
                width: MediaQuery.of(context).size.width/2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    titleText("02", context, 28),
                    const SizedBox(height: 15,),
                    titleText("Complete Supervision", context, 12)
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              //circleRadius,
              height: 60,
              //circleRadius,
              decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.transparent),
              child: Padding(
                padding: EdgeInsets.all(circleBorderWidth),
                child: const DecoratedBox(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/images/imoji2.png",
                            // 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                          ))),
                ),
              ),
            ),
          ],
      ),
        ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PeopleSupport()));
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top: 25,right: 8
                    // circleRadius / 2.0
                  ),
                  child:  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.lightWhite,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0,
                            offset: Offset(0.75, 0.00)
                        )
                      ],
                    ),
                    height: 120,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        titleText("02", context, 28),
                        const SizedBox(height: 15,),
                        titleText("Active Supervision", context, 12)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  //circleRadius,
                  height: 60,
                  //circleRadius,
                  decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.all(circleBorderWidth),
                    child: const DecoratedBox(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/imoji1.png",
                                // 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  _banner(){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomBar(index: 2,)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/leaderboard.png')
            )
          ),
        ),
      ),
    );
  }

  _menteesCard(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        secTitleText("My Mentees", context, 18),
        const SizedBox(height: 15,),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: mantees.length,
            itemBuilder: (context, index){
          return myMenteesCard(
            context, mantees, index
          );
        })
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: colors.whit,
      drawer: Drawer(
        // backgroundColor: colors.whit,
        child: Container(
          // width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/icons/background.png')
              )
          ),
          // width: MediaQuery.of(context).size.width/2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset("assets/images/user3.png"),
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                         Text("Kevin Rock",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colors.secondary
                            //Theme.of(context).colorScheme.fontColor,
                          ),),
                        Text("+61261960198",
                          style:  TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: colors.fntClr
                            //Theme.of(context).colorScheme.fontColor,
                          ),)
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50,),
                drawerItem('assets/icons/availability.png', "Availability", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Availability()));
                }),
                // drawerItem('assets/icons/drawer2.png', "Invoice", (){
                //  // Navigator.push(context, MaterialPageRoute(builder: (context)=> InvoiceHistory()));
                // }),
                drawerItem('assets/icons/outlook.png', "Outlook", (){
                }),
                drawerItem('assets/icons/savePoint.png', "Sharepoint", (){}),
                drawerItem('assets/icons/skool.png', "Skool", (){}),
                drawerItem('assets/icons/loom.png', "Loom", (){}),
                drawerItem('assets/icons/faq.png', "FAQ", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FaqScreen()));
                }),
                drawerItem('assets/icons/privacyPolicy.png', "Privacy Policy", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivacyPolicy()));
                }),
                drawerItem('assets/icons/termCondition.png', "Terms & Conditions", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TermCondition()));
                }),
                drawerItem('assets/icons/logout.png', "Logout", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                }),

              ],
            ),
          ),
        ),
      ),
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.lightWhite,
            leading: InkWell(
              onTap: (){
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8, bottom: 8),
                child: Container(
                    padding: const EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colors.secondary),
                      color: colors.whit
                  ),
                  child: const ImageIcon(
                    AssetImage('assets/icons/drawericon.png',),
                    color: colors.secondary
                  )
                  // Icon(Icons.menu_outlined, color: appColorWhite,),
                ),
              ),
            ),
            // backgroundColor: colors.whit,
            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(20),
            //         bottomRight: Radius.circular(20)
            //     )
            // ),
            elevation: 0,
            title: Container(
              height: 120,
                width: 150,
                child: Image.asset('assets/icons/appIcon.png')),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Notifications()));
                  // _scaffoldKey.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colors.secondary),
                          color: colors.whit
                      ),
                      child: const Icon(
                          Icons.notifications,
                          color: colors.secondary)
                    // Icon(Icons.menu_outlined, color: appColorWhite,),
                  ),
                ),
              ),
              Container(width: 10),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              _intro(),
              _secondHeader(),
           //   _banner(),
             // _availableFeature()
              SizedBox(height: 15,),
              _menteesCard()
            ],
          ),
        ),
      ),
      // drawer: getDrawer(),
    );
  }
}
