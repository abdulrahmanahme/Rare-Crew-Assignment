import 'package:rare_crew/model/profile_model.dart';
import 'package:rare_crew/view_model/dio_helper.dart';
import 'package:rare_crew/services/cache_service.dart';

class ProfileData {
  MYDataModel? userData;
  final getchangedData = '/api/v1/user/me';
  Future getUserData() async {
    var res = await DioHelper.getData(url: getchangedData, token: CacheService.token.toString());
    return res.data;
  }
}
