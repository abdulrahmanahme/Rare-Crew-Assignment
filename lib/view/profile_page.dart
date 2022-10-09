import 'package:flutter/material.dart';
import 'package:rare_crew/component/component.dart';
import 'package:rare_crew/services/cache_service.dart';
import 'package:rare_crew/view/sign_in_page.dart';
import 'package:rare_crew/view_model/profile_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/flutter_toast.dart';
import '../model/profile_model.dart';

final profileProvider = FutureProvider<MYDataModel>((ref) async {
  var res = await ProfileData().getUserData();
  MYDataModel myDataModel = MYDataModel.fromJson(res);
  return myDataModel;
 
});

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pressAttention = false;
  String? image;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) {

          final getmyData = ref.watch(profileProvider);
        
          return getmyData.when(
            data: (value) {
              return Column(children: [
                SizedBox(
                  height: 10.h,
                ),

               Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                      value.data?.imageUrl?? "",
                                      ),
                                    ),
                                  ),
                                ),

                                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                      value.data?.imageUrl?? "https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png",
                                      ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),

                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        value.data?.firstName ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          // fontFamily: 'Lobster-Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Profile_button(
                  name: value.data?.firstName ?? "",
               
                  press: () {
                   
                  },
                  width: 40.w,
                ),
                 Profile_button(
                  name: value.data?.lastName ?? "",
                  icon: Icons.payment,
                  press: () {},
                  width: 40.w,
                ),
                Profile_button(
               

                  name:  value.data?.email ?? "",
              
                  press: () {
                  
                  },
                  width: 10.w,
                ),
              
                Profile_button(
                  name: 'Logout',
               
                  press: () {
                    CacheService.removeCacheData(key: 'token');
                    showToast(
                        text: 'Logout success', state: ToastStates.SUCCESS);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  width: 40.w,
                ),
              ]);
            },
            error: (error, trace) {
              print(error);
              print(trace);
              return const Text('error');
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
      ),
    ));
  }
}

