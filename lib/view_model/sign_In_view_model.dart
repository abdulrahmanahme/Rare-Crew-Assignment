import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rare_crew/component/flutter_toast.dart';
import 'package:rare_crew/model/user_model.dart';
import 'package:rare_crew/services/cache_service.dart';
import 'package:rare_crew/view/home_page.dart';
import 'package:rare_crew/view_model/dio_helper.dart';
import 'package:rare_crew/services/cache_service.dart';
import '../model/profile_model.dart';
final loginProvider =
    ChangeNotifierProvider((ref) => SignInViewModel(ref: ref));

class SignInViewModel extends ChangeNotifier {
  SignInViewModel({
    required this.ref,
  });
  Ref ref;

  final login = '/api/v1/auth/signin';
  UserData? userData;
  bool isLoading = false;

  void userLogin({
    required String? email,
    required String? password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      var value = await DioHelper.postData(url: login, data: {
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
      showToast(text: 'login done', state: ToastStates.SUCCESS);
    } on DioError catch (err) {
      MYDataModel myDataModel = MYDataModel.fromJson(err.response?.data);
      showToast(text: myDataModel.message, state: ToastStates.ERROR);
    } catch (e) {
      showToast(text: "error", state: ToastStates.ERROR);
    

    }

    isLoading = false;
    notifyListeners();
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
