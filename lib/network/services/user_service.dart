import 'package:mobile/constants/apis_const.dart';
import 'package:mobile/network/api_client.dart';


class UserService {

  Future getUser()async{
    var response = await ApiClient(ApisConst.user).gets();
    return response;
  }

}