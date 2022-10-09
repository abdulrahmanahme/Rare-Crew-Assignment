import 'package:flutter/material.dart';
import 'package:rare_crew/component/component.dart';
import 'package:rare_crew/view/sign_up_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/view_model/sign_In_view_model.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();

  var controllerpassword = TextEditingController();

  var controlleremail = TextEditingController();
 @override
  void dispose() {
    controlleremail.dispose();
    controllerpassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: Device.orientation == Orientation.portrait
                                ? 10.h
                                : 15.h,
                            width: 80.w,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 38,
                                color: Colors.blueGrey.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Hey, Enter your details to get sign in to your account',
                            style: TextStyle(
                              fontSize:
                                  Device.orientation == Orientation.portrait
                                      ? 20.sp
                                      : 25.sp,
                              color: Colors.blueGrey.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Consumer(builder: (context, ref, _) {
                    final provider = ref.watch(loginProvider);
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 23, top: 10, bottom: 5),
                                child: Text(
                                  'Email',
                                  style: TextStyle(

                               

                                      fontSize: 18,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'jannah'),
                                ),
                              ),
                            ],
                          ),

                         
                          defaultFormField(

                            controller: controlleremail,

                            validate: (value) {
                              if (!value!.contains('@') ||
                                  !value.contains('.com') ||
                                  value.isEmpty) {
                                return 'Invalid Email!!';
                              }

                              return null;
                            },

                            type: TextInputType.emailAddress,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'jannah'),
                                ),
                              ),
                            ],
                          ),

                          defaultFormField(

                            controller: controllerpassword,

                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },

                            type: TextInputType.visiblePassword,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                        
                          provider.isLoading
                              ? const CircularProgressIndicator(
                                  color: Color(0xff10ADBC),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey.shade900,

                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 140,
                                        right: 140),


                                    elevation: 6,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      provider.userLogin(
                                          email: controlleremail.text,
                                          password: controllerpassword.text,
                                          context: context);
                                    }
                                  
                                  },
                                ),
                          SizedBox(
                            height: 4.h,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Not registered yet? ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blueGrey.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SingUpScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'Create an Account',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]);
                  }),
                ]),
          ),
        ),
      ),
    );
  }
}
