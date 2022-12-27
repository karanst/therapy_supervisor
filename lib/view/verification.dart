import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/bottomBar/bottombar.dart';
import 'package:therapy/view/buttons/appButton.dart';

class Verification extends StatefulWidget {
  final String? mobile, otp;
   Verification({Key? key, this.mobile, this.otp}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var focusedBorderColor = Theme.of(context).colorScheme.secColor;
    //Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    var borderColor = Theme.of(context).colorScheme.secColor;
    // Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color:Theme.of(context).colorScheme.fontColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.lightWhite,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            color: colors.primary,),
        ),
        title: const Text("Verification",
        style: TextStyle(
          color: colors.primary
        ),),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              subTitleText("Code has been sent to", context, 16),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, bottom: 40),
                child: secTitleText("+61${widget.mobile}", context, 22),
              ),
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  validator: (value) {
                    return value == '1234' ? null : 'Pin is incorrect';
                  },
                  // onClipboardFound: (value) {
                  //   debugPrint('onClipboardFound: $value');
                  //   pinController.setText(value);
                  // },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              subTitleText("Haven't received the verification code?", context, 14),
              TextButton(onPressed: (){}, child: secTitleText("Resend", context, 16),),
              // textBtn(
              //         (){
              //
              // },
              //     context),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AppBtn(
                  title: "Verify Authentication Code",
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        BottomBar()));
                  },
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  fSize: 18,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
