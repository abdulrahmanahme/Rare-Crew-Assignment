import 'package:flutter/material.dart';
import 'package:rare_crew/component/component.dart';
import 'package:rare_crew/view/sign_in_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/view_model/sign_up_vew_model.dart';
import 'package:rare_crew/view/home_page.dart';

class SingUpScreen extends ConsumerStatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends ConsumerState<SingUpScreen> {

  var controllerfisrtname = TextEditingController();

  var controlleremail = TextEditingController();

  var controllerpassword = TextEditingController();

  var controllerlastname = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    controlleremail.dispose();
    controllerfisrtname.dispose();
    controllerlastname.dispose();
    controllerpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(signUpProvider);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height:
                        Device.orientation == Orientation.portrait ? 5.h : 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: Device.orientation == Orientation.portrait
                                ? 7.h
                                : 15.h,
                            width: 80.w,
                          
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 30,
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
                            'Hey, Enter your details to create a new account',
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
                    height: 1.2.h,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NametextForm(
                                name: 'Frist name',
                              ),
                              defaultFormField(
                                controller: controllerfisrtname,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }

                                  return null;
                                },
                                type: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  NametextForm(
                    name: 'Last name',
                  ),
                  defaultFormField(
                    controller: controllerlastname,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }

                      return null;
                    },
                    type: TextInputType.emailAddress,
                  ),
                  NametextForm(
                    name: 'Email',
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
                  NametextForm(
                    name: 'Password',
                  ),
                  defaultFormField(
                    label: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          provider.changePasswordVisibility();
                        },
                        icon: Icon(provider.suffix)),
                    isPassword: provider.isPassword,
                    controller: controllerpassword,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
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
                            // backgroundColor: Colors.blueGrey.shade900,
                            primary: Colors.blueGrey.shade900,

                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 140, right: 140),

                            elevation: 6,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              provider.userSginUp(
                                firstName: controllerfisrtname.text,
                                lastName: controllerlastname.text,
                                email: controlleremail.text,
                                password: controllerpassword.text,
                                context: context,
                              );
                            }

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                ));
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
                          'Already have an account? ',
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
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Login',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
