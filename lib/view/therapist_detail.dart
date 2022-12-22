import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';

class TherapistDetail extends StatefulWidget {
  const TherapistDetail({Key? key}) : super(key: key);

  @override
  State<TherapistDetail> createState() => _TherapistDetailState();
}

class _TherapistDetailState extends State<TherapistDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Therapist Details",
            style: TextStyle(
                color: colors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: colors.primary,
            ),
          )),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/therapyDetial.png",
                      fit: BoxFit.fill,
                    ),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //     // borderRadius: BorderRadius.circular(50)
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: Text(
                            "Dr. Moron George",
                            style:  TextStyle(
                                color: Theme.of(context).colorScheme.fontColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Sr. Therapist",
                          style: TextStyle(color: Theme.of(context).colorScheme.fontClr),
                        ),
                      ],
                    ),
                    Container(
                        // alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            color: colors.secondary1,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("500"),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/images/coin.png",
                              height: 15,
                            )
                          ],
                        )),

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hourly Rate",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.fontClr,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "\$10",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.fontClr,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "4 yr",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.fontClr,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    SizedBox(height: 6,),
                   Container(
                     child: RichText(
                         text: TextSpan(
                       text: "Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing",
                       style: TextStyle(color: colors.subTxtClr,fontSize: 14,fontWeight: FontWeight.w500,height: 1.5,),
                        children: <TextSpan>[
                          TextSpan(text: " "),
                          TextSpan(text: "Read More",style: TextStyle(color: Theme.of(context).colorScheme.secColor,fontWeight: FontWeight.w500,fontSize: 14,decoration: TextDecoration.underline))
                        ]
                     ),

                     )
                   )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
