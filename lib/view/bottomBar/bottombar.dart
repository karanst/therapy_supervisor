import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/Invoice_page.dart';
import 'package:therapy/view/home.dart';
import 'package:therapy/view/leaderboard.dart';
import 'package:therapy/view/profile/profile.dart';
import 'package:therapy/view/schedule/schedule.dart';

class BottomBar extends StatefulWidget {
  final int? index;
  const BottomBar({Key? key, this.index}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    // const Schedule(),
    // const Leaderboard(),
    const InvoicePage(),
    const Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index != null) {
      pageIndex = widget.index!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Exit"),
              content: Text("Are you sure you want to exit?"),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colors.primary
                  ),
                  child: Text("YES"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colors.primary
                  ),
                  child: Text("NO"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
      return true;
    },
      child:
      Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    )
    );
  }
  /*bottomBarElement(String title, image, int index ){
    return InkWell(
      onTap: (){
        setState(() {
          pageIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        // width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: pageIndex == index ? colors.primary : Theme.of(context).colorScheme.fontColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
                AssetImage(image),
              color: pageIndex == index ? Colors.white : colors.fntClr,
            ),
           const  SizedBox(width: 3,),
            // Image.asset(image),
            pageIndex == index ?
            Text(title,
            style: const TextStyle(
              color: Colors.white
            ),)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }*/bottomBarElement(String title, image, int index ){
    return InkWell(
      onTap: (){
        setState(() {
          pageIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        // width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: pageIndex == index ? colors.primary : Theme.of(context).colorScheme.lightWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(image),
              color: pageIndex == index ? Theme.of(context).colorScheme.lightWhite : Theme.of(context).colorScheme.fontColor,
            ),
            const  SizedBox(width: 3,),
            // Image.asset(image),
            pageIndex == index ?
            Text(title,
              style:  TextStyle(
                color: Theme.of(context).colorScheme.lightWhite,
              ),)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomBarElement("Home", "assets/icons/dashboard1.png", 0),
          bottomBarElement("Invoice", "assets/images/invoice.png", 1),
          bottomBarElement("Profile", "assets/icons/dashboard4.png", 2),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 0;
          //     });
          //   },
          //   icon: pageIndex == 0
          //       ? const Icon(
          //     Icons.home_filled,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.home_outlined,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 1;
          //     });
          //   },
          //   icon: pageIndex == 1
          //       ? const Icon(
          //     Icons.work_rounded,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.work_outline_outlined,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 2;
          //     });
          //   },
          //   icon: pageIndex == 2
          //       ? const Icon(
          //     Icons.widgets_rounded,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.widgets_outlined,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 3;
          //     });
          //   },
          //   icon: pageIndex == 3
          //       ? const Icon(
          //     Icons.person,
          //     // color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.person_outline,
          //     // color: Colors.white,
          //     size: 35,
          //   ),
          // ),
        ],
      ),
    );
  }
}