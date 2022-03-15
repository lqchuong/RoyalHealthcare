
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/loader_hud.dart';
import '../../widgets/theme.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 45,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/logoHealth.png", width: Dimensions.width45, height: Dimensions.height45,),
                            SizedBox(width: Dimensions.width10),
                            BigText(text: "ROYAL HEALTHCARE", fontWeight: FontWeight.w700,size: 30, )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child:  Container(
                                height: 240,
                                constraints: const BoxConstraints(
                                    maxWidth: 500
                                ),
                                margin: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFE1E0F5),
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      opacity: 0.8,
                                      image: AssetImage(
                                        'assets/icon_home_page/background2.jpeg',
                                      ),
                                    ),
                                ),
                              ),
                      ),
                      // BigText(text: "Đăng nhập", fontWeight: FontWeight.w00,size: 30, )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          constraints: const BoxConstraints(
                              maxWidth: 500
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(text: 'Chúng tôi sẽ gửi cho bạn một ', style: TextStyle(color: AppColors.mainColor)),
                              TextSpan(
                                  text: 'One Time Password ', style: TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold)),
                              TextSpan(text: 'bằng số điện thoại của bạn', style: TextStyle(color: AppColors.mainColor)),
                            ]),
                          )),
                      Container(
                        height: 40,
                        constraints: const BoxConstraints(
                            maxWidth: 500
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: CupertinoTextField(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(4))
                          ),
                          controller: phoneController,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          placeholder: '+84...',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(
                            maxWidth: 500
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/otp');
                            if (phoneController.text.isNotEmpty) {
                              //loginStore.getCodeWithPhoneNumber(context, phoneController.text.toString());
                            } else {
                              // /loginStore.loginScaffoldKey.currentState.showSnackBar(SnackBar(
                              //   behavior: SnackBarBehavior.floating,
                              //   backgroundColor: Colors.red,
                              //   content: Text(
                              //     'Please enter a phone number',
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              // ));
                            }
                          },
                          color: AppColors.mainColor,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Tiếp tục',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    color: AppColors.mainColor,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),




      // StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('testing').snapshots(),
      //   builder: (
      //       BuildContext context,
      //       AsyncSnapshot<QuerySnapshot> snapshot,
      //       ){
      //     if (!snapshot.hasData) return const SizedBox.shrink();
      //     return ListView.builder(
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder:(BuildContext context, int index){
      //         final docData = snapshot.data?.docs[index].data();
      //         final dateTime = (docData!['timestamp'] as Timestamp).toDate();
      //         return ListTile(
      //           title: Text(dateTime.toString()),
      //         );
      //
      //       },
      //     );
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => FirebaseFirestore.instance
        .collection("testing")
        .add({'timestamp':Timestamp.fromDate(DateTime.now())}),
        child: Icon(Icons.add),
      ),
    );
  }
}
