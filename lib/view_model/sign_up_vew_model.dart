// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/model/user_model.dart';
import 'package:rare_crew/model/user_model.dart';
import 'package:rare_crew/view_model/dio_helper.dart';

import '../component/flutter_toast.dart';
import '../model/profile_model.dart';
import '../services/cache_service.dart';
import '../view/home_page.dart';

final signUpProvider = ChangeNotifierProvider((_) => SingUpViewModel());

class SingUpViewModel extends ChangeNotifier {
  UserData? userData;
  final register = '/api/v1/auth/signup';
  bool isLoading = false;
  Future userSginUp({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      var value = await DioHelper.postData(url: register, data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
      });
      userData = UserData.fromJson(value.data);
      CacheService.cacheData(key: 'token', value: userData?.data?.refreshToken);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeScreen(),
          ));
      // save token to database
      showToast(text: 'signUp done', state: ToastStates.SUCCESS);
    } on DioError catch (err) {
      MYDataModel myDataModel = MYDataModel.fromJson(err.response?.data);
      showToast(text: myDataModel.message, state: ToastStates.ERROR);
    

    } catch (e) {
      showToast(text: "error", state: ToastStates.ERROR);
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    notifyListeners();
  }
}
